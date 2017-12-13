class EventsController < ApplicationController
  before_action :authorize

  def index
    @events = Event.all
    puts "params : #{params}"
    search_targets = [:host, :event, :activities, :address, :zipcode]
    search_targets.each do |s|
      if Event.where(s => params[:search]) != []
        @events = Event.where(s => params[:search])
        redirect_to month_calendar_index_path
        puts "EVENTS FOUND! #{@events}"
      else
        @events = Event.all
      end
    end
  end

  def create
    @event_params = params.require(:event).permit(:event, :host, :activities, :address, :zipcode, :search, :start_time)
    @event = Event.new(@event_params)
    current_user.events << @event
    if @event.save
      redirect_to month_calendar_index_path
    else
      render "new"
    end
  end

  def new
    @event = Event.new
    render :new
  end

  def show
    event_id = params[:id]
    @event = Event.find_by_id(event_id)
  end
  def edit
    event_id = params[:id]
    @event = Event.find_by_id(event_id)
  end

  def update
    event_id = params[:id]
    @event = Event.find_by_id(event_id)
    if current_user == @event.user
      @event.update_attributes(events_params)
      redirect_to event_path
    else
      redirect_to month_calendar_index_path
    end

  end

  def destroy
    @user = User.find_by_id(params[:id])
    event_id = params[:id]
    @event = Event.find_by_id(event_id)
    if current_user == @event.user
      @event.destroy
      redirect_to events_path
    else
      redirect_to month_calendar_index_path
    end
  end

  def upvote
    @event= Event.find(params[:id])
    @event.upvote_by current_user
    redirect_back fallback_location: event_path
  end

  def downvote
    @event = Event.find(params[:id])
    @event.downvote_by current_user
    redirect_back fallback_location: event_path
  end

  private
  def events_params
    params.require(:event).permit(:event, :host, :activities, :address, :zipcode, :search, :start_time)
  end

end

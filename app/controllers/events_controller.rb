class EventsController < ApplicationController
  # before_action :authorize
  def index
    @events = Event.all
    puts "params : #{params}"
    search_targets = [:host, :event, :activities, :address, :zipcode]
    # @events = Event.search(params[:search])
    search_targets.each do |s|
      if Event.where(s => params[:search]) != []
        @events = Event.where(s => params[:search])
        puts "EVENTS FOUND! #{@events}"
      else
        @events = Event.all
      end
    end
  end

  def create
    @event_params = params.require(:event).permit(:event, :host, :activities, :address, :zipcode, :search, :start_time)
    @event = Event.new(@event_params)
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
    event = Event.find_by_id(event_id)
    event.update_attributes(events_params)
    redirect_to month_calendar_index_path
  end

  def destroy
    event_id = params[:id]
    event = Event.find_by_id(event_id)
    event.destroy
    redirect_to events_path
  end
  private
  def events_params
    params.require(:event).permit(:event, :host, :activities, :address, :zipcode, :search, :start_time)
  end

end

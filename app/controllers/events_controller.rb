class EventsController < ApplicationController
  def index
    @events = Event.all
    render :index
  end

  def create
    event_params = params.require(:event).permit(:event, :host, :activities, :address, :zipcode)
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
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
    redirect_to event_path
  end

  def destroy
    event_id = params[:id]
    event = Event.find_by_id(event_id)
    event.destroy
    redirect_to events_path
  end
  private
  def events_params
    params.require(:event).permit(:event, :host, :activities, :address, :zipcode)
  end

end

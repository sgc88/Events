class MonthCalendarController < ApplicationController
  before_action :login_required, :only => :action_aviable_only_for_logged_in

  def index
    @meetings = Event.all
  end

  def search
    @events = Event.where(zipcode: params[:search])
  end
end

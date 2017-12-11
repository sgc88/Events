class MonthCalendarController < ApplicationController
  def index
    @meetings = Event.all
  end
end

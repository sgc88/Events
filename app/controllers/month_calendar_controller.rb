class MonthCalendarController < ApplicationController
<<<<<<< HEAD
  def index
    @meetings = Event.all
  end
=======
  before_action :login_required, :only => :action_aviable_only_for_logged_in

  def index
    @meetings = Event.all
  end

  def search
    @events = Event.where(zipcode: params[:search])
  end
>>>>>>> 20c022cf3aef3d78ea4459a050959cd4ac79d952
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD
=======
  # before_action :login_required, :only => :action_aviable_only_for_logged_in

>>>>>>> 20c022cf3aef3d78ea4459a050959cd4ac79d952
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
end

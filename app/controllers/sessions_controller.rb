class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    puts user
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
<<<<<<< HEAD
=======
      puts("#{current_user} ********************")
>>>>>>> 20c022cf3aef3d78ea4459a050959cd4ac79d952
      redirect_to '/'
    else
      flash[:error] = "Incorrect username or password."
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

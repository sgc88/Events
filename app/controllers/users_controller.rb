class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user= User.new(allowed_params)
      if @user.save
        redirect_to root_url, :notice => "Successfully signed up!"

      else
        redirect_to 'users/new'
      end
  end

  def index
  @users = User.all
end

def show
  @user = User.find_by_id(params[:id])
  if current_user.id == @user.id
    render :show
  else
    redirect_to "/"
  end
end

def edit
  @user = User.find_by_id(params[:id])
  if current_user.id == @user.id
    render :edit
  else
    redirect_to "/"
  end
end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(allowed_params)
    redirect_to @user, notice: 'User has been updated'
  else
    render :edit
  end
end


private

  def allowed_params
    params.require(:user).permit(:name, :email, :password)
  end

end

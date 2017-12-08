class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user= User.new(allowed_params)
      if @user.save
        redirect_to root_url, notice: "Successfully signed up!"

      else
        redirect_to 'users/new'
      end
  end

  def index
  @users = User.all
end

def show
  @user = User.find(params[:id])

end

def edit
  @user = User.find_by_id(params[:id])
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

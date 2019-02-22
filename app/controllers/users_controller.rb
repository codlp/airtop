
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:myrooftops, :myreservations, :reservations]

  def show
    skip_authorization
    @user = User.find(params[:id])
  end

  def edit
    skip_authorization
    @user = User.find(params[:id])
  end

  def update
    skip_authorization
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    redirect_to user_path(@user)
    else
      render '/edit'
    end
  end

  def myrooftops
    skip_authorization
    @user = current_user
    @rooftops = @user.rooftops
  end

  def myreservations
    skip_authorization
    @user = current_user
    @rooftops = @user.rooftops
  end

  def rooftops_reservations
    skip_authorization
    @user = current_user
    @rooftops = @user.rooftops
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo, :photo_cache)
  end
end

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:myrooftops, :myreservations, :reservations]

  def myrooftops
    skip_authorization
    @user = current_user
    @rooftops = @user.rooftops
  end

  def myreservations
    skip_authorization
    @user = current_user©
    @rooftops = @user.rooftops
  end

  def rooftops_reservations
    skip_authorization
    @user = current_user
    @rooftops = @user.rooftops
  end
end

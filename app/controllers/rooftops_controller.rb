class RooftopsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def show
    @rooftop = Rooftop.find(params[:id])
  end
end

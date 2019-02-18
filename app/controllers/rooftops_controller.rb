class RooftopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def new
    @rooftop = Rooftop.new
  end

  def create
    @rooftop = Rooftop.new(rooftop_params)
    if @rooftop.save
      redirect_to rooftop_path(@rooftop)
    else
      render :new
    end
  end
end

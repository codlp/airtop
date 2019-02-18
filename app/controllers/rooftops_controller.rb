class RooftopsController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_rooftop, only: [:show, :edit, :update, :destroy]
  
  def index
    @rooftops = Rooftop.all
  end
  
  def show
    @rooftop = Rooftop.find(params[:id])
  end
  
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

  private

  def set_rooftop
    @rooftop = Rooftop.find(params[:id])
  end

  def rooftop_params
    params.require(:rooftop).permit(:name, :address, :price_per_hour, :photo)
  end

end

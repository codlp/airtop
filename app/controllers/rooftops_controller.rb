class RooftopsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_rooftop, only: [:show, :edit, :update, :destroy]

  def index
    @rooftops = policy_scope(Rooftop).order(created_at: :desc)
  end

  def show
    @rooftop = Rooftop.find(params[:id])
  end

  def new
    @rooftop = Rooftop.new
  end

  def create
    @rooftop = Rooftop.new(rooftop_params)
    @rooftop.user_id = current_user.id
    if @rooftop.save
      redirect_to rooftop_path(@rooftop)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @rooftop.update_attributes(rooftop_params)
    redirect_to rooftop_path(@rooftop)
  end

  def destroy
    @rooftop.destroy
    redirect_to rooftops_path
  end

  private

  def set_rooftop
    @rooftop = Rooftop.find(params[:id])
    authorize @rooftop
  end

  def rooftop_params
    params.require(:rooftop).permit(:name, :address, :description, :price_per_hour, :photo)
  end
end

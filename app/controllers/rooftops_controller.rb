class RooftopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_rooftop, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @rooftops = policy_scope(Rooftop).order(created_at: :desc)

    # Map
    @rooftops = Rooftop.where.not(latitude: nil, longitude: nil)

    @markers = @rooftops.map do |rooftop|
      {
        lng: rooftop.longitude,
        lat: rooftop.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { rooftop: rooftop })
      }
    end
    @rooftops_search = Rooftop.search_by_name_and_address(params[:query])
  end

  def show
    @rooftop = Rooftop.find(params[:id])
    @reservation = Reservation.new

    @marker =
      {
        lng: @rooftop.longitude,
        lat: @rooftop.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { rooftop: @rooftop })
      }
  end

  def new
    @rooftop = Rooftop.new
    authorize @rooftop
  end

  def create
    @rooftop = Rooftop.new(rooftop_params)
    authorize @rooftop
    @rooftop.user = current_user
    if @rooftop.save
      redirect_to rooftop_path(@rooftop)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @rooftop = Rooftop.find(params[:id])
    if @rooftop.update_attributes(rooftop_params)
    redirect_to rooftop_path(@rooftop)
    else
      render 'edit'
    end
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
    params.require(:rooftop).permit(:name, :address, :description, :price_per_hour, :photo, :photo_cache)
  end
end

class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_reservation, only: [:show, :new, :destroy, :accept, :decline]

  def index
    @reservations = policy_scope(reservation).order(created_at: :desc)
  end

  def show
  end

  def new
    @rooftop = Rooftop.find(params[:rooftop_id])
    @reservation = Reservation.new
  end

  def create
    @rooftop = Rooftop.find(params[:rooftop_id])
    @reservation = Reservation.new(reservation_params)
    authorize @reservation
    @reservation.rooftop = @rooftop
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  def accept
    @reservation.status = "Accepted"
    authorize @reservation
    redirect_to reservations_path
  end

  def decline
    @reservation.status = "Declined"
    authorize @reservation
    redirect_to reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at)
  end
end

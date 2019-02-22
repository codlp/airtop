class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :accept, :decline]
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
      redirect_to user_reservations_path
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
    skip_authorization
    @reservation.status = "Accepted"
    @reservation.save
    redirect_to rooftops_reservations_path
  end

  def decline
    skip_authorization
    @reservation.status = "Declined"
    @reservation.save
    redirect_to rooftops_reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at)
  end
end

class MessagesController < ApplicationController
  before_action :skip_authorization

  def index
    set_reservation
    @messages = Message.all
  end

  def new
    set_reservation
    @message = Message.new
  end

  def create
    set_reservation
    @messages = Message.all
    @message = Message.new(message_params)
    @message.reservation = Reservation.find(params[:reservation_id])
    if @message.save
      redirect_to reservation_messages_path
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to reservation_messages_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end
end

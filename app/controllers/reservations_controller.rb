class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
    @reservation.start_date = params[:start_date]
    @reservation.end_date = params[:end_date]
    @reservation.people = params[:people]
    @reservation.room_id = params[:room_id]
    @day = (@reservation.end_date - @reservation.start_date) / 60 / 60 / 24
    @day = @day.to_i
    @room = Room.find(@reservation.room_id)
    @reservation.price = @room.price * @reservation.people * @day
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :price))
    @reservation.user_id = current_user.id
    @reservation.save
    redirect_to action: :index
  end
end

class BookingsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @bookings = Booking.all
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.find(params[:id])
  end

  def new
    @user = current_user
    @booking = Booking.new
    @record = Record.find(params[:artist, :title, :year, :label, :genre])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save

  end

  def edit
    @booking.user = current_user
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
  end

  # def destroy
  # end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

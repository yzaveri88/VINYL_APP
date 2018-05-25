class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @records = Record.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @record = Record.find(params[:record_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @record = Record.find(params[:record_id])
    @booking.record = @record
    @booking.user = current_user

    if @booking.save
      redirect_to record_bookings_path(@record)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @booking.user = current_user

  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path(@booking)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status == "accepted"
    @booking.save
    redirect_to record_bookings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status == "declined"
    @booking.save
    redirect_to record_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

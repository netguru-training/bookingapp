class BookingsController < ApplicationController
  before_action :check_ownership, only: [:new, :edit, :create, :destroy]

  expose(:bookings)
  expose(:booking, attributes: :booking_params)
  expose(:places)
  expose(:place)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    booking.user = current_user
    if booking.save
      current_user.bookings << booking
      redirect_to dashboard_index_path
    else
      redirect_to place_path(booking.place), flash: {error:'You already made a booking on that date'}
    end
  end

  def destroy
  end

  def accept
    self.booking = Booking.find(params[:id])
    message = booking.accept! ? 'Booking accepted' : 'Something bad happened'
    redirect_to bookings_path, notice: message
  end

  def decline
    self.booking = Booking.find(params[:id])
    message = booking.decline! ? 'Booking rejected' : 'Something bad happened'
    redirect_to bookings_path, notice: message
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :place_id)
  end

  def check_ownership
    redirect_to root, flash: "You can't book your own place" if current_user.is_owner?(booking)
  end
end

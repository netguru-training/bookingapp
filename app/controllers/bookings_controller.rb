class BookingsController < ApplicationController
  before_action :check_ownership, only: [:new, :edit, :update, :destroy]

  expose(:bookings)
  expose(:booking, attributes: :booking_params)

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
    #if current_user.is_booking_owner?(booking)
    if booking.place.owned_by?(current_user)
      redirect_to root_path, flash: {error: "You can't book your own place"}
    elsif booking.save
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
    redirect_to root_path, flash: {error: "You can't book your own place2"} if current_user.is_booking_owner?(booking)
  end
end

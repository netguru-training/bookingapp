class BookingsController < ApplicationController
  before_action :check_ownership, only: [:new, :edit, :create, :destroy]

  expose(:bookings, attributes: :bookings_params)
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
  end

  def destroy
  end

  def accept
    message = booking.accept! ? 'Booking accepted' : 'Something bad happened'
    redirect_to bookings_path, flash: message
  end

  def decline
    message = booking.decline! ? 'Booking rejected' : 'Something bad happened'
    redirect_to bookings_path, flash: message
  end

  private

  def bookings_params
    params.require(:bookings).permit(:date_from, :date_to, :place_id)
  end

  def check_ownership
    redirect_to root, flash: "You can't book your own place" if current_user.is_owner?(booking)
  end
end

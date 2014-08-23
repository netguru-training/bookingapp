class BookingsController < ApplicationController
  before_action :owner?, :only => [:new, :edit, :create, :destroy]
  expose (:bookings)
  expose (:booking)

  expose_decorated(:bookings, attributes :bookings_params)
  expose_decorated(:booking, attributes :booking_params)

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
    
  end

  def decline
    
  end



  private

  def bookings_params
    params.require(:bookings).permit(:date_from, :date_to, :place_id)
  end
  def owner?
    redirect_to root, flash:'' if current_user.is_owner?(booking)
  end
end

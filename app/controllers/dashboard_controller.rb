class DashboardController < ApplicationController
  before_action :authenticate_user!
  expose(:places) { Place.for_user(current_user.id) }
  expose(:bookings) { current_user.bookings.where(confirmed: true) }

  def index
  end
end

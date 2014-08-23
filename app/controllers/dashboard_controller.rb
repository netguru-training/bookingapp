class DashboardController < ApplicationController
  before_action :authenticate_user!
  expose(:places) { Place.for_user(current_user.id) }
  expose(:bookings) { current_user.bookings.where(confirmation: true) }

  def index
  end
end

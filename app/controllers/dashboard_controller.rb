class DashboardController < ApplicationController
  before_action :authenticate_user!
  # expose(:places) { Place.find_by(user: current_user). }
  def index
  end
end

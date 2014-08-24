class ApplicationController < ActionController::Base  
  before_action :authenticate_user!, except: [:index, :facebook]
  expose(:places_to_search) { Place.all.pluck(:name) }
  expose(:notifications) { check_for_new_rent_offers }
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protected

  def check_for_new_rent_offers
    @notifications ||= begin
      ids = Place.for_user(current_user.id).pluck(:id)
      Booking.where(confirmed: false, place_id: ids)
    end
  end

end

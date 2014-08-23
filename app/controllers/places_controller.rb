class PlacesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @place = Place.new
  end

  def show
  end

  def create
    self.place = Place.new(place_params)

    if place.save
      redirect_to places_path
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
  end

  private
    def place_params
      params.require(:places).permit(:price, :name, :description, :user_id)
    end

end

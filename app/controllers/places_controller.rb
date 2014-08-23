class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user_is_author, :only => [:edit, :update]
  expose(:place, attributes: :place_params)
  expose(:places)


  def check_if_user_is_author
    return if place.user == current_user
    redirect_to root_path, :flash => { :error => "You're not the owner of that place" }
  end

  def new
  end

  def show
  end

  def index
  end

  def create
    place.user = current_user

    if place.save
      redirect_to places_path
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if place.save
      redirect_to places_path
    else
      render action: 'new'
    end
  end

  private
    
  def place_params
    params.require(:place).permit(:price, :name, :description)
  end

end

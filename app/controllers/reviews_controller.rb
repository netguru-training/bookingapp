class ReviewsController < ApplicationController
  before_action :authenticate_user!
  expose(:review, attributes: :review_params)
  expose(:place) { Place.find(params[:place_id]) }
  

  def show
  end

  def new
    @places = Place.all
  end

  def edit
  end

  def create
    review.user = current_user
    review.place = place
    if review.save
      redirect_to place_path(place), notice: 'Review created.'
    else      
      flash[:alert] = review.errors[:base].first 
      redirect_to place_path(place)
    end
  end

  def update
    if review.save
      redirect_to place_path(place), notice: 'Review updated.'
    else
      flash[:alert] = review.errors[:base].first 
      render :new, alert: 'Review wasnt updated.'
    end
  end

  def destroy  
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

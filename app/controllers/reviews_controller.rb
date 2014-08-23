class ReviewsController < ApplicationController
  before_action :authenticate_user!
  expose(:review, attributes: :review_params)
  expose(:place) { Place.find(params[:place_id]) }
  

  def show
  end

  def new 
  end

  def edit
  end

  def create
    review.user = current_user
    review.place = place
    if review.save
      redirect_to places_path, notice: 'Review created.'
    else
      redirect_to places_path
    end
  end

  def update
    if review.save
      redirect_to places_path, notice: 'Review updated.'
    else
      render :new, alert: 'Review wasnt updated.'
    end
  end

  def destroy  
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

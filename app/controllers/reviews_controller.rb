class ReviewsController < ApplicationController
  expose(:review, attributes: :review_params)
  expose(:place) { Place.find(params[:place_id]) }
  before_action :authenticate_user!  

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
      redirect_to root_path, notice: 'Review created.'
    else
      render action: 'new'
    end
  end

  def update
    if review.save
      redirect_to root_path, notice: 'Review updated.'
    else
      render action: 'new'
    end
  end

  def destroy  
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

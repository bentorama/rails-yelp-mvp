class ReviewsController < ApplicationController
  def new
    # TODO
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new # instantiate the form
  end

  def create
    # TODO
    @review = Review.new(review_params)
    # associate the review with the corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

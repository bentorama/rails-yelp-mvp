class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new # instantiate the form
  end

  def new
    # TODO
    @restaurant = Restaurant.new # instantiate the form
  end

  def create
    # TODO
    @restaurant = Restaurant.new(restaurant_params)
    # associate the restaurant with the corresponding restaurant
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

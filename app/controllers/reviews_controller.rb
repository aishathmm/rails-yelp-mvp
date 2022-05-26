class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:index, :new, :create ]

  def index
    @reviews = Reviews.where(restaurant_id: @restaurant)
  end

  def new
    @review = Reviews.new
  end

  def create
    @review = Review.new(review_params)
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
    params.require(:review).permit(:content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end

class FoodController < ApplicationController

  def create
    food = Food.new(food_params)
    unless food.save!
      render json: { error: food.errors.full_messages[0] }, status: 400
    end
    render json: food
  end


  private
  def food_params
    params.permit(
      :name,
      :foodometer
    )
  end
end
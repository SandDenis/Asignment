class ToyController < ApplicationController
  def create
    toy = Toy.new(toy_params)
    unless toy.save!
      render json: { error: toy.errors.full_messages[0] }, status: 400
    end
    render json: toy
  end


  private
  def toy_params
    params.permit(
      :name,
      :happiness
    )
  end
end
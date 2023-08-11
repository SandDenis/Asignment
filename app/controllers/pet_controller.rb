class PetController < ApplicationController
  require 'will_paginate/array'

  # used to create a pet
  def create
    pet = Pet.new(pet_params)
    unless pet.save!
      render json: { error: pet.errors.full_messages[0] }, status: 400
    end
    render json: pet
  end

  # if user is logged in he is able to adopt a pet
  def adopt
    pet = Pet.find(params[:id])
    current_user.pets << pet

    render json: {success: "Successfully adopted #{pet.name}"}
  rescue ActiveRecord::RecordNotFound => e
    e.message
  end

  # used to feed the pet
  def feed
    food = Food.find(params[:food_id])
    pet = Pet.find(params[:id])
    if pet.feed(food.foodometer)
      render json: pet.as_json, status: :ok
    else
      render json: {error_message: "I'm full!"}
    end
  rescue ActiveRecord::RecordNotFound => e
    e.message
  end

  # used to play with the pet
  def play
    toy = Toy.find(params[:toy_id])
    pet = Pet.find(params[:id])
    if pet.play(toy.happiness)
      render json: pet.as_json, status: :ok
    else
      render json: {error_message: "I'm hungry!"}
    end
  rescue ActiveRecord::RecordNotFound => e
    e.message
  end

  # used to get all pets
  def index
    pets = Pet.all
    pets = pets.paginate(page: params[:page], per_page: params[:per_page])
    render json: pets.as_json, status: :ok
  end

  # used to get all pets of the user
  def my_pets
    pets = current_user.pets
    pets = pets.paginate(page: params[:page], per_page: params[:per_page])
    render json: pets.as_json, status: :ok
  end

  # used to get all non adopted pets from the adoption center
  def adopt_list
    pets = Pet.where(user_id: null)
    pets = pets.paginate(page: params[:page], per_page: params[:per_page])
    render json: pets.as_json, status: :ok
  end

  # used to find one pet
  def show
    pet = Pet.find(params[:id])
    render json: pet.as_json, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    e.message
  end

  private
  def pet_params
    params.permit(
      :name,
      :breed,
      :health,
      :happiness,
      :user_id
    )
  end
end
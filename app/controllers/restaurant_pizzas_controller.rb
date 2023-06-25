class RestaurantPizzasController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  wrap_parameters format: []

  def index
    restaurant_pizzas = RestaurantPizza.all
    render json: restaurant_pizzas, status: :ok
  end

  def create
    restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
    pizza = Pizza.find_by(id: params[:id])
    render json: pizza, status: :created
  end

  private

  def render_unprocessable_entity_response(e)
    render json: { error: e.invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def restaurant_pizza_params
    params.permit(:price, :pizza_id, :restaurant_id)
  end
end

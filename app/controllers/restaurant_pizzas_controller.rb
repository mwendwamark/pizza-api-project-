class RestaurantPizzasController < ApplicationController
    def index 
        restaurant_pizzas = RestaurantPizza.all 
        render json: restaurant_pizzas, status: :ok
    end
end
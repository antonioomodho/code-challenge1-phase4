class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  #Get restaurant_pizzas
  def index
  restaurant_pizzas = RestaurantPizza.all
  render json: restaurant_pizzas
  end
    #POST /restaurant_pizzas
    def create
      restaurant_pizza = RestaurantPizza.new(restaurant_pizza_params)
  
      if restaurant_pizza.save
        render json: restaurant_pizza.pizza.slice(:id, :name, :ingredients), status: :created
      else
        render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def restaurant_pizza_params
      params.require(:restaurant_pizza).permit(:price, :pizza_id, :restaurant_id)
    end
  
    def render_not_found_response
      render json: { error: 'validation errors' }, status: :not_found
    end
  end
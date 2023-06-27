class PizzasController < ApplicationController
    def show
        pizzas = Pizza.find(params[:id])
        if Pizza
            render json: pizzas, except: [:created_at, :updated_at]
        else
            render json: { error: "Pizza not found" }, status: 404
        end
    end
    
    #GET /pizzas
    def index
        pizzas = Pizza.all
        render json: pizzas, except: [:created_at, :updated_at]
    end
    end
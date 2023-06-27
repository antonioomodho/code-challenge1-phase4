class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
      
    #GET /restaurants
    def index
            restaurants =Restaurant.all
            render json: restaurants, except: [:created_at, :updated_at]
        end
    
        #GET /restaurants/:id
        def show
            restaurants = find_restaurants
            render json: restaurants, except: [:created_at, :updated_at]
          
        end
        #DELETE /restaurants/:id
        def destroy
            restaurants = find_restaurants
            restaurants.destroy
            head :no_content
        end
        private
        def find_restaurants
            Restaurant.find(params[:id])
        end
    def restaurants_params
        params.permit(:name, :address)
    end
    def render_not_found_response
        render json:{error: "Restaurant not found"}, status: 404
    end
    end
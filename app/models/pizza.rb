class Pizza < ApplicationRecord
    has_many :Restaurants, through: :RestaurantPizza
end
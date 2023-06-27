class Restaurant < ApplicationRecord
    has_many :restaurant_pizzas, dependent: :destroy
    # ...
  end
class RestaurantPizzasController < ApplicationController
    def create 
        new_pizza = RestaurantPizza.create(params.permit(:price, :pizza_id, :restaurant_id))
        if new_pizza.valid?
            render json: new_pizza.pizza, status: :created
        else 
            render json: {message: new_pizza.errors.full_messages }, status: 422
        end
    end
end

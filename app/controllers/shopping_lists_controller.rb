# app/controllers/shopping_lists_controller.rb
class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @missing_foods = calculate_missing_foods(@user)
    @total_price = calculate_total_price(@missing_foods)
  end

  private
  
  def calculate_missing_foods(user)
    # Fetch all recipes for the user
    user_recipes = user.recipes.includes(:foods)
    # Fetch the user's general food list
    user_foods = user.foods
    
    # Calculate missing foods by comparing with user's recipes
    missing_foods = []
    user_recipes.each do |recipe|
      missing_foods += recipe.foods - user_foods
    end
    
    missing_foods.uniq # Remove duplicates
  end
  
  def calculate_total_price(foods)
    foods.sum(&:price)
  end
end

class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    render json: @ingredients
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

end

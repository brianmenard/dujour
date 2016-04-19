class RecipesController < ApplicationController

  def index
    @user = current_user
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    #NEED TO FIND OUT HOW TO ADD AMOUNT TO JOIN TABLE
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

private

def recipe_params
    params.require(:recipe).permit(:name, :instructions, :ingredients_attributes[:name, :amount])
end

end

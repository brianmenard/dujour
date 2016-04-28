class RecipesController < ApplicationController

  def index
    @user = current_user
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    5.times do 
      @recipe.ingredients.build()
    end
  end

  def create
    @recipe = Recipe.create(recipe_params)
    RecipeIngredient.setAmounts(@recipe.id, amount_params)
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

private

  def recipe_params
      params.require(:recipe).permit(:name, :instructions, :ingredients_attributes => [:name])
  end

  def amount_params
    params.require(:recipe).permit(:ingredients_attributes => [:name, :amount])
  end

end

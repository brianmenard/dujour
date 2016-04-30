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
    @recipe.user = current_user
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect_to recipes_path
  end

private

  def recipe_params
      params.require(:recipe).permit(:name, :instructions, :photo, :ingredients_attributes => [:name])
  end

  def amount_params
    params.require(:recipe).permit(:ingredients_attributes => [:name, :amount])
  end

end

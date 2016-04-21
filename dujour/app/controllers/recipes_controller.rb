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
    #NEED TO CREATE OR FIND BY INGREDIENT NAME && BUILD SETTER/GETTER METHODS FOR INGREDIENT AMOUNT
    puts params
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

private

def recipe_params
    params.require(:recipe).permit(:name, :instructions)
end

end

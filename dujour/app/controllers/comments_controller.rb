class CommentsController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id]
    @comments = Recipe.comments
    render json: @comments
  end

end

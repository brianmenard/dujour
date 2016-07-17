class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    render json: @comment
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = Recipe.comments
    render json: @comments
  end

def comment_params
  params.permit(:content)
end

end

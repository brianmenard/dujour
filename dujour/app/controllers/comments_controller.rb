class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    @comment.recipe = Recipe.find(params[:id])
    render json: @comment
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = Recipe.comments
    render json: @comments
  end

def comment_params
  params.require(:comment).permit(:content)
end

end

class ListItemsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @list_items = ListItem.all
    @new_item = ListItem.new
  end

  def create
    @item = ListItem.create(item_params)
    redirect_to list_item_path(@item.id)
  end

  def show
    @item = ListItem.find(params[:id])
    render json: @item
  end


  def item_params
    params.require(:list_item).permit(:content)
  end

end

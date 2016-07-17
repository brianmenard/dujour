class ListItemsController < ApplicationController

  def index
    @list_items = ListItem.all
    @new_item = ListItem.new
  end

  def create
    @item = ListItem.create(item_params)
    redirect_to list_items_path
  end


  def item_params
    params.require(:list_item).permit(:content)
  end

end

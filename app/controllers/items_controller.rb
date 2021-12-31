class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

 def new
    @item = Item.new
 end

 def create
  @item = Item.new(item_params)

  if @item.save
    redirect_to user_path(@item.user.id)
  else
    render :new
  end
end

 def show
    @item = Item.find(params[:id])
 end

 def edit
  @item = Item.find(params[:id])
end

def update
  @item = Item.find(params[:id])
if @item.update(item_params)
  redirect_to user_path(@item.user.id)
else
  render :edit
end
end

 def destroy
  @item = Item.find(params[:id])
  @item.destroy
  redirect_to user_path(current_user.id)
end

private

def item_params
  params.require(:item).permit(:image,:item_name, :price, :introduce, :category_id, :items_status_id, :send_fee_id).merge(user_id: current_user.id)
 end

end

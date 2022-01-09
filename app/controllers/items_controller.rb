class ItemsController < ApplicationController

  def index

    @item2 = Item.where(category_id: '2')
    @item3 = Item.where(category_id: '3')
    @item4 = Item.where(category_id: '4')
    @item5 = Item.where(category_id: '5')
    @item6 = Item.where(category_id: '6')
    @item7 = Item.where(category_id: '7')
    @item8 = Item.where(category_id: '8')
    @item9 = Item.where(category_id: '9')
    @item10 = Item.where(category_id: '10')

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

def get_category
  @items = Item.all

end

end

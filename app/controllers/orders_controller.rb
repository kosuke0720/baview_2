class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to user_path(current_user.id)
    else
      @order_address = OrderAddress.new(order_params)
      render :index
      end
  end
  

  private

  def set_item
    @item = Item.find(params[:id])
   end

  def order_params
    params.require(:order_address).permit(:zip_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token], 
      currency: 'jpy'
    )
  end

end

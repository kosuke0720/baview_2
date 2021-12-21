class UsersController < ApplicationController
  before_action :move_to_show, only: [:new]
  before_action :move_to_mypage, only: [:show]

  def show
    @user = User.find(params[:id])
    # @baby = Baby.find(params[:id])
    # @item = Item.find(params[:id])
    @items = Item.where(user_id: current_user.id).includes(:user).order('created_at DESC')
    @babies = Baby.where(user_id: current_user.id).includes(:user).order('created_at DESC')
  end

  def new
  end

  private

  def move_to_show
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  def move_to_mypage
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

end

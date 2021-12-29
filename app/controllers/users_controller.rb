class UsersController < ApplicationController
  before_action :move_to_show, only: [:new]
  before_action :move_to_mypage, only: [:show]

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: @user.id).includes(:user).order('created_at DESC')
    @babies = Baby.where(user_id: @user.id).includes(:user).order('created_at DESC')
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    binding.pry
  if @user.update(user_params)
    redirect_to user_path(@user.id)
  else
    render :edit
  end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email)
   end

  def move_to_show
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  def move_to_mypage
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(@user.id)
    end
  end

end

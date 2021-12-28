class UsersController < ApplicationController
  before_action :move_to_show, only: [:new]
  before_action :move_to_mypage, only: [:show]
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: current_user.id).includes(:user).order('created_at DESC')
    @babies = Baby.where(user_id: current_user.id).includes(:user).order('created_at DESC')
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
    binding.pry
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
       redirect_to user_path(@user.id)
      else
       render :edit
      end
    else
      redirect_to user_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:password ,:password_confirmation )
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

  def set_user
    @user = current_user || User.new
  end

end

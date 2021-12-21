class ArticlesController < ApplicationController
  before_action :move_to_mypage, only: [:index, :new, :destroy]

  def index
    @baby = Baby.find(params[:baby_id])
    @articles = Article.where(baby_id: @baby.id).includes(:baby).order('created_at DESC')
  end

  def new
    @article = Article.new
    @baby = Baby.find(params[:baby_id])
  end

  def create
    @article = Article.new(article_params)
    @baby = Baby.find(params[:baby_id])

    if @article.save
      redirect_to baby_articles_path(@baby.id)
    else
      render :new
    end
  end

  def show
    @baby = Baby.find(params[:baby_id])
    @article = Article.find(params[:id])
  end

  def destroy
    @baby = Baby.find(params[:baby_id])
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to baby_articles_path(@baby.id)
  end

  private

  def article_params
    params.require(:article).permit(:content_date, :content, :image).merge(baby_id: params[:baby_id])
  end

  def move_to_mypage
    @baby = Baby.find(params[:baby_id])
    unless @baby.user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end

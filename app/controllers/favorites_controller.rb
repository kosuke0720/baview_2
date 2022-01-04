class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @article = Article.find(:id)
    @baby = Baby.find(:baby_id)
    if @favorite.save
      redirect_to baby_article_path(@baby.id, @article.id)
    else
      render baby_article_path(@baby.id, @article.id)
  end

  def destroy
  end

end

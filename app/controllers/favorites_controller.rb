class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
    @article = Article.find(@favorite.article.id)
  end

  def create
    favorite = current_user.Favorite.new(article_id: clicked_article.id)
    if favorite.save
      redirect_back(fallback_location: root_path)
    else
      render baby_article_path(@baby.id, @article.id)
  end

  def destroy
  end

  private

  def clicked_article
    Article.find(params[:article_id])
  end

end

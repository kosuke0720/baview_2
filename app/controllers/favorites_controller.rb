class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
  end

  def create
    favorite = current_user.Favorite.new(post_id: clicked_post.id)
    if favorite.save
      redirect_back(fallback_location: root_path)
    else
      render baby_article_path(@baby.id, @article.id)
  end

  def destroy
  end

  private

  def clicked_post
    Article.find(params[:article_id])
  end

end

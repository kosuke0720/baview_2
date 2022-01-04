class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
  end

  def create
    favorite = current_user.Favorite.new(post_id: clicked_post.id)
    if @favorite.save
      redirect_to baby_article_path(@baby.id, @article.id)
    else
      render baby_article_path(@baby.id, @article.id)
  end

  def destroy
  end

end

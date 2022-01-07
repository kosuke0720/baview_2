class FavoritesController < ApplicationController

  def create
    if current_user.favorites.exists?

      redirect_back(fallback_location: root_path)

    else

      binding.pry
      @favorite = current_user.favorites.new(article_id: clicked_article.id)
      if @favorite.save
        redirect_back(fallback_location: root_path)
      else
        render baby_article_path(@baby.id, @article.id)
      end

    end
  end

  def destroy

    current_user.favorites.find_by(article_id: params[:article_id]).destroy
    redirect_back(fallback_location: root_path)

  end

  private

  def clicked_article
    Article.find(params[:article_id])
  end

end

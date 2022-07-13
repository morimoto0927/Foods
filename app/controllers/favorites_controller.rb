class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    @favorite.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to post_path(params[:post_id])
  end
end

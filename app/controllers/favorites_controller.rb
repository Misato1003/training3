class FavoritesController < ApplicationController
  
  before_action :set_post
  before_action :authenticate_user! #ログイン中の料理のみに許可（未ログインなら、ログイン画面に移動)
  
  def create
    Favorite.create(user_id: current_user.id, cook_id: params[:id])
    redirect_to root_path
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, cook_id: params[:id])
    favorire.destroy
    redirect_to root_path
  end
end

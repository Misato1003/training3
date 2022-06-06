class FavoritesController < ApplicationController
  
  before_action :authenticate_user! #ログイン中の料理のみに許可（未ログインなら、ログイン画面に移動)
  
  def create
    Favorite.create(user_id: current_user.id, cook_id: params[:id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, cook_id: params[:id])
    favorite.destroy
  end
end

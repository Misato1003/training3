class FavoritesController < ApplicationController
  
  before_action :authenticate_user! #ログイン中の料理のみに許可（未ログインなら、ログイン画面に移動)
  before_action :cook_find 
  
  def create
    if @cook.user_id != current_user.id
      Favorite.create(user_id: current_user.id, cook_id: params[:id])
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, cook_id: params[:id])
    favorite.destroy
  end

  private
  
  def cook_find
    # 投稿内容の取得
    @cook = Cook.find(params[:id])
  end
end

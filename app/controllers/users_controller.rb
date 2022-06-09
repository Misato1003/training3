class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    user = User.find(params[:id])
    return redirect_to root_path unless current_user.id == user.id
    @user_favorites = user.favorites
  end
end

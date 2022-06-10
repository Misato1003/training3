class CooksController < ApplicationController
  
  #ログインしている人だけが投稿を行えるように[authenticate_user!]を使用
  before_action :authenticate_user!, except: :index
  
  #他人に編集ができないようした（投稿者自身が編集ができるようにした)
  before_action :correct_user_cook, only: [:edit, :update]
  
  def index
    @cooks = Cook.all
    @posts = Post.all
  end
  
  def new
    @cook = Cook.new
  end
  
  def create
    @cook = Cook.new(params.require(:cook).permit(:name, :poin, :ingredient, :recipe).merge(user_id: current_user.id))
    if @cook.save
      flash[:notice] = "料理の新規登録しました"
      redirect_to :cooks
    else
      render "new"
    end
  end
  
  def show
    @cook = Cook.find(params[:id])
    @post = Post.new
    @posts = Post.where(cook_id: @cook.id)
  end
  
  def edit
    @cook = Cook.find(params[:id])
  end
  
  def update
    @cook = Cook.find(params[:id])
    if @cook.update(params.require(:cook).permit(:name, :poin, :ingredient, :recipe).merge(user_id: current_user.id))
      flash[:notice] = "料理の情報を更新しました"
      redirect_to :cooks
    else
      render "edit"
    end
  end
  
  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    flash[:notice] = "料理を削除しました"
    redirect_to :cooks
  end
  
  private
  def correct_user_cook
    @cook = Cook.find(params[:id])
    @user = @cook.user_id
    redirect_to(cooks_path) unless @user == current_user.id
  end
end

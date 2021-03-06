class PostsController < ApplicationController
  before_action :authenticate_user!, except: :indexs
  
  #他人に編集ができないようした（投稿者自身が編集ができるようにした)
  before_action :correct_user_post, only: [:edit, :update]
  
  def index
    @posts = Post.all
  end
  
  def new
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:content, :cook_id, :user_id).merge(user_id: current_user.id))
    if @post.save
      flash[:notice] = "新規投稿しました"
      redirect_to :posts
    else
      render "posts"
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:content, :cook_id, :user_id))
      flash[:notice] = "投稿を更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to :posts
  end
  
  private
  def correct_user_post
    @post = Post.find(params[:id])
    @user = @post.user_id
    redirect_to(posts_path) unless @user == current_user.id
  end
end

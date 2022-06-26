class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @posts = Post.where(status: "share").page(params[:page]).per(10).order(created_at: :DESC)
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @customer = @post.customer
    redirect_to admin_customer_posts_path(@customer), notice: "投稿を削除しました！"
  end

  def tag
    @customer = current_customer
    @tag = Tag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end

end

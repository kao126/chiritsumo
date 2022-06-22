class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @posts = Post.where(status: "share").page(params[:page]).per(10).order(created_at: :DESC)
  end

  def show
    @post = Post.find(params[:id])
  end

  def tag
    @customer = current_customer
    @tag = Tag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end

end

class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    @post_category = PostCategory.new(post_id: @post.id, category_id: params[:name])
    @post_category.save
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @customer = @post.customer
    redirect_to customer_profile_path(@customer.username)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @customer = @post.customer
    redirect_to customer_profile_path(@customer.username)
  end

  def tag
    @customer = current_customer
    @hashtag = Tag.find_by(hashname: params[:name])
    @posts = @hashtag.posts
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
class Public::PostsController < ApplicationController

  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if params[:draft]
      # 下書きボタンを押下した場合
      @post.status = Post.statuses[:draft]
      if @post.save
        redirect_to customer_profile_path(current_customer.username), notice: "下書きを保存しました！"
      else
        flash.now[:alert] = "登録できませんでした。入力内容をご確認のうえ再度お試しください。"
        render :new
      end
    else
      # 投稿ボタンを押下した場合
      if @post.save
        redirect_to root_path, notice: "投稿しました！"
      else
        flash.now[:alert] = "投稿できませんでした。入力内容をご確認のうえ再度お試しください。"
        render :new
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if params[:share]
      # 投稿ボタンを押下した場合
      @post.status = Post.statuses[:share]
      @post.touch(:created_at)
      if @post.update(post_params)
        redirect_to root_path, notice: "投稿しました！"
      else
        @post.status = Post.statuses[:draft]
        flash.now[:alert] = "投稿できませんでした。入力内容をご確認のうえ再度お試しください。"
        render :edit
      end
    else
      # 下書き（もしくは、更新）ボタンを押下した場合
      if @post.update(post_params)
        redirect_to post_path(@post), notice: "下書きを保存しました！"
      else
        flash.now[:alert] = "登録できませんでした。入力内容をご確認のうえ再度お試しください。"
        render :edit
      end

    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @customer = @post.customer
    redirect_to customer_profile_path(@customer.username), notice: "投稿を削除しました！"
  end

  def tag
    @customer = current_customer
    @tag = Tag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption, :status, :category_id)
  end

  def ensure_correct_customer
    @post = Post.find(params[:id])
    @customer = @post.customer
    unless @customer == current_customer
      redirect_to customer_profile_path(current_customer.username)
    end
  end

end
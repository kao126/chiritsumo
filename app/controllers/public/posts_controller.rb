class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if params[:pending]
      # 下書きボタンを押下した場合
      if @post.update(status: "pending")
        redirect_to customer_profile_path(current_customer.username), notice: "下書きを保存しました！"
      else
        render :new, alert: "登録できませんでした。入力内容をご確認のうえ再度お試しください"
      end
    else
      # 投稿ボタンを押下した場合
      if @post.save(context: :share)
        redirect_to root_path, notice: "投稿しました！"
      else
        render :new, alert: "投稿できませんでした。入力内容をご確認のうえ再度お試しください"
      end
    end
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
    if params[:shared]
     # 投稿ボタンを押下した場合
      if @post.update(status: :shared)
        redirect_to root_path, notice: "投稿しました！"
      else
        render :edit, alert: "投稿できませんでした。入力内容をご確認のうえ再度お試しください"
      end
    else
      # 下書きボタンを押下した場合
      if @post.update(post_params)
        redirect_to customer_profile_path(current_customer.username), notice: "下書きを保存しました！"
      else
        render :edit, alert: "登録できませんでした。入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @customer = @post.customer
    redirect_to customer_profile_path(@customer.username)
  end

  def tag
    @customer = current_customer
    @tag = Tag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end

  def pending
    @customer = current_customer
    @posts = Post.where(status: "pending").order(created_at: :DESC)
  end


  private
  def post_params
    params.require(:post).permit(:image, :caption, :status, :category_id)
  end

end
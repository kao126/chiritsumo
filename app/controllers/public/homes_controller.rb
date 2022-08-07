class Public::HomesController < ApplicationController
  def top
    @posts = Post.where(status: "share").page(params[:page]).per(10).order(created_at: :DESC)
  end

  def about
    @post_customer = Post.where(status: "share").pluck(:customer_id).uniq
    @posts = Post.where(status: "share").all
    # @post_sum = Post.where(status: "share").joins(:category).group("categories.name").order('category_id ASC').count
  end
end

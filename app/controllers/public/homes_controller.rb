class Public::HomesController < ApplicationController
  def top
    @posts = Post.where(status: "shared").page(params[:page]).per(15).order(created_at: :DESC)
  end

  def about
    @post_customer = Post.pluck(:customer_id).uniq
    @posts = Post.all
    @sum = Post.joins(:categories).group("categories.name").order('categories.id').count
  end
end

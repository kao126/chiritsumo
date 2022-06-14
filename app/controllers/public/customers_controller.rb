class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(username: params[:username])
    @posts = @customer.posts.order(created_at: :DESC)
  end

  def withdraw
    @customer = current_customer
    if @customer.update(withdraw_params)
      reset_session
      redirect_to root_path
    else
      render "customer/show"
    end
  end

  def favorites
    @customer = Customer.find_by(username: params[:username])
    favorites = @customer.favorites.pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end


  private

  def withdraw_params
    params.require(:customer).permit(:is_deleted)
  end


end
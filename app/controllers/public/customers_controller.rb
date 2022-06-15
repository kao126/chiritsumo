class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(username: params[:username])
    @posts = @customer.posts.order(created_at: :DESC)
  end

  def update
    @customer = Customer.find_by(id: params[:id])
    @customer.update(customer_params)
    redirect_to customer_profile_path(@customer.username)
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

  def customer_params
    params.require(:customer).permit(:profile_image, :last_name, :first_name, :last_name_kana, :first_name_kana, :username, :introduction, :telephone_number, :email, :postal_code, :prefecture_code, :address_city, :address_street, :address_building)
  end

  def withdraw_params
    params.require(:customer).permit(:is_deleted)
  end


end
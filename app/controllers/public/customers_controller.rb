class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = Customer.find_by(username: params[:username])
    @posts = @customer.posts.where(status: "share").order(created_at: :DESC)
  end

  def update
    @customer = Customer.find_by(id: params[:id])
    @customer.update(customer_params)
    redirect_to customer_profile_path(@customer.username), notice: "会員情報を更新しました！"
  end

  def withdraw
    @customer = current_customer
    #ここでis_deletedカラムの値を"退会"に更新
    @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path, notice: "退会の手続きが完了しました。"
  end

  def favorites
    @customer = Customer.find_by(username: params[:username])
    favorites = @customer.favorites.pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end


  private

  def customer_params
    params.require(:customer).permit(
      :profile_image,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :username,
      :introduction,
      :telephone_number,
      :email,
      :postal_code,
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building
    )
  end

end
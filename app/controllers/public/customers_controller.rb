class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :ensure_guest_customer, only: [:update, :withdraw]


  def show
    @customer = Customer.find_by(username: params[:username])
    @posts = @customer.posts.where(status: "share").order(created_at: :DESC)
    favorites = @customer.favorites.pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @draft_posts = @customer.posts.where(status: "draft").order(created_at: :DESC)

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

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーのためこの動作は制限されています。'
    end
  end

end
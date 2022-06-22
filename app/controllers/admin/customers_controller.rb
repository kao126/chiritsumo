class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).per(4)
  end

  def post_index
    @customer = Customer.find(params[:id])
    @customer_posts = @customer.posts.where(status: "share").page(params[:page]).per(10).order(created_at: :DESC)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer), notice: "会員情報を変更しました！"
  end

  private

  def customer_params
    params.require(:customer).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :username,
      :introduction,
      :email,
      :telephone_number,
      :postal_code,
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building,
      :is_deleted
    )
  end

end

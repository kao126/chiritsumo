class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by!(username: params[:username])
    @posts = @customer.posts
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

end
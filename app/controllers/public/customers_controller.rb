class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by!(username: params[:username])
    @posts = @customer.posts
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


  private

  def withdraw_params
    params.require(:customer).permit(:is_deleted)
  end


end
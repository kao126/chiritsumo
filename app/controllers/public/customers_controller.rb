class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
    
  end

  def edit
    @customer = Customer.find(params[:id])
  end

end
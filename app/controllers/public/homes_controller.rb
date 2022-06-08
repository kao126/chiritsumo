class Public::HomesController < ApplicationController
  def top
    @posts = Post.all
    # @customer = Customer.find(params[:id])
  end

  def about
  end
end

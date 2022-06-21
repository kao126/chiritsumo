class Public::SearchesController < ApplicationController

  before_action :authenticate_customer!

  def search
    @content = params[:content]
    @posts = Post.search_for(@content)
  end
end

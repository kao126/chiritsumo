class Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @posts = Post.search_for(@content)
  end
end

class Admin::SearchesController < ApplicationController

  before_action :authenticate_admin!

  def search
    @content = params[:content]
    @posts = Post.search_for(@content)
  end
end

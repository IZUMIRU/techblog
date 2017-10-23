class BlogsController < ApplicationController
  # before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.order('postday DESC').page(params[:page]).per(1)
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :image, :url)
  end
end

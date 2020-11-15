class BlogsController < ApplicationController
  before_action :set_blog, only:[:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "I have created a blog!"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Tweet updated!"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"Tweet deleted"
  end

  private
  def set_blog
      @blog=Blog.find(params[:id])
  end

  def blog_params
      params.require(:blog).permit(:tweet)
  end
end

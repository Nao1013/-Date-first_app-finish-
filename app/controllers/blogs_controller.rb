class BlogsController < ApplicationController
 
   def create
    blog = Blog.new(blog_params)
    if blog.save
        flash[:notice] = "投稿しました"
      redirect_to blog_path(blog.id)
    else
      render :index
    end
   end
  
  def index
     @blog = Blog.new
     @blogs = Blog.all
  end

  def show
   @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
        flash[:notice] = "再投稿しました"
    redirect_to blog_path(blog.id) #Showページへアクセス
    else
    render :edit
    end
  end
  
  def destroy
      blog = Blog.find(params[:id])
      blog.destroy
      redirect_to blogs_path
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end

class BlogPostsController < ApplicationController
  
  # function to show all posts
  def index
    @blog_posts = BlogPost.all
  end

  # function to show the details of a post
  def show 
    begin 
      @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound 
      redirect_to root_path # if records not found return to the home page
    end
  end

  # function to create new post form
  def new 
    @blog_post = BlogPost.new
  end

  # function to create an database record for a blog
  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to new_blog_post_path
    else 
      render :new
    end 
  end


  private 
  def blog_post_params 
    params.require(:blog_post).permit(:title, :body)
  end


end

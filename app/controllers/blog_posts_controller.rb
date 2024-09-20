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
      # redirect_to new_blog_post_path
      redirect_to @blog_post
    else 
      render :new, status: :unprocessable_entity
    end 
  end

  # function to get the edit form 
  def edit 
    @blog_post = BlogPost.find(params[:id])
  end

  # function to update a blog
  def update
    @blog_post = BlogPost.find(params[:id]) 
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # function to destroy an object from database
  def destroy 
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to root_path
  end



  # Private methods are stored here
  private 
  # function to set permission of `create` function
  def blog_post_params 
    params.require(:blog_post).permit(:title, :body)
  end


end

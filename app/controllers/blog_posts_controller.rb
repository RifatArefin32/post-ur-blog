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



end

class FeedsController < ApplicationController
  
  def home
    if params[:tag].present?
      @feed_posts = Post.tagged_with(params[:tag])
      @tag = params[:tag]
    else
      @feed_posts = Post.all 
    end
    
  end
  
end

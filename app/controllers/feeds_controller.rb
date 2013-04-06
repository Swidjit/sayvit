class FeedsController < ApplicationController
  
  def home
    @feed_posts = Post.all
  end
  
end

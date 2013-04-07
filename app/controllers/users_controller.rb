class UsersController < ApplicationController
  before_filter :load_resource, :only => :show
  
  def show
    @feed_posts = @user.posts
  end
  
  private
  
  def load_resource
    @user = User.find(params[:id])
  end
end

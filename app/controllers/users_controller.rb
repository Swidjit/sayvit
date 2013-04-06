class UsersController < ApplicationController
  before_filter :load_resource, :only => :show
  
  def show
    
  end
  
  private
  
  def load_resource
    @user = User.find(params[:id])
  end
end

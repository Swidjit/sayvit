class LabelsController < ApplicationController
  def create
    @label = Label.new(params["label"])
    @label.post = Post.find(params["label"]["post_id"])
    @label.user = current_user
    if @label.save
      @counter = Label.where(:post_id => @label.post.id, :label => @label.label)
      @counter = @counter.count.to_s
      respond_to do |format|
        format.js {render 'create'}
      end
    else
      @notice = "You can't do that"
      respond_to do |format|
        format.js {render 'failed'}
      end      
    end  
    


  end
  
  def toggle
    if signed_in?
      if Label.exists?(:user_id => current_user.id, :post_id => params["label"]["id"], :label => params["label"]["label"])
        self.destroy
      else
        self.create
      end  
    else 
      respond_to do |format|
        format.js {render 'toggle_fail'}
      end
      
    end
  end
  
  def destroy
    Label.where(:user_id => current_user.id, :post_id => params["label"]["id"], :label => params["label"]["label"]).destroy_all
    @counter = Label.where(:post_id => params["label"]["id"], :label => params["label"]["label"])
    @counter = @counter.count.to_s
    @label_type = params["label"]["label"]
    respond_to do |format|
      format.js {render 'destroy'}
    end
  end
end

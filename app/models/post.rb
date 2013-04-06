class Post < ActiveRecord::Base
  attr_accessible :post_time, :title, :user_id
end

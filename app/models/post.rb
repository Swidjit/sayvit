class Post < ActiveRecord::Base
  attr_accessible :title
  belongs_to :user
  
  acts_as_taggable
end

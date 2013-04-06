class Label < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :post
  
  validates_uniqueness_of :user_id, :scope => [:post_id,:label]
  #validate :user_cannot_label_own_item
  #after_save :update_user_familiarity

  #after_create :notify_item_owner
  attr_accessible :label, :user_id, :post_id


  def user_cannot_label_own_item
    errors.add(:base, 'You cannot recommend your own item') if post.user == user
  end
  
end

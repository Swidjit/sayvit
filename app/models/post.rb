class Post < ActiveRecord::Base
  attr_accessible :title, :content, :image, :tag_list

  belongs_to :user
  has_attached_file :image, :styles => {:thumb => 'x100', :croppable => '600x600>', :big => '1000x1000>',
                      :url => ":s3_domain_url",
                      :path => "/:class/images/:id_:basename.:style.:extension"}

  has_many :labels
  
  scope :recently_labeled, lambda { |type|
    joins(:labels).where(["#{Label.table_name}.label = ?", type])
  }


  acts_as_taggable



end

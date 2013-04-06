class Post < ActiveRecord::Base
  attr_accessible :title, :content, :image

  belongs_to :user
  has_attached_file :image, :styles => {:thumb => 'x100', :croppable => '600x600>', :big => '1000x1000>',
                      :url => ":s3_domain_url",
                      :path => "/:class/images/:id_:basename.:style.:extension"}

  has_many :labels
  
  scope :recently_labeled, lambda { |type|
    joins(:labels).where(["#{Label.table_name}.label = ?", type])
  }


  ## acts_as_taggable

  auto_html_for :body do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

end

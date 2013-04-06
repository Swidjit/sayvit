class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :password, :password_confirmation, :remember_me, :last_name, :first_name,
      :display_name

  #validates_presence_of :first_name, :last_name, :display_name
  #validates :display_name, :presence => true, :format => { :with => /^[a-zA-Z0-9]+$/, :message => 'can contain only letters and numbers - no spaces or symbols' }
  #validates_uniqueness_of :display_name, :case_sensitive => false
  
  def active_for_authentication? 
    super 
  end 

  def approved?
    valid_zips = [ 14883,13864,13073,13068,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14813,14867,14886,14882,14817,13053];
    if (valid_zips.include?(self.zipcode.to_i))
      true
    else
      false
    end
  end

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

end

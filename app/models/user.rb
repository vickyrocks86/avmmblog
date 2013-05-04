class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  devise :omniauthable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:uid, :provider

  ##Method
  def self.find_for_facebook_oauth(auth , signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
    user = User.create(:name => auth.extra.raw_info.first_name,
    :provider => "facebook",
    :uid => auth.uid,
    # :profile_pic => auth.extra.raw_info.image,
    :email => auth.info.email,
    :password => Devise.friendly_token[0,20]
    )
    end
    user
    end


end





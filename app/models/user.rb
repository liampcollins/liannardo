class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :linkedin, :twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :image, :name, :bio, :uid, :provider, :facebook_token, :google_oauth2_token, :profile_picture
  # attr_accessible :title, :body

  mount_uploader :image, ImageUploader


  has_many :posts
  has_many :votes
  has_and_belongs_to_many(:users,
    :join_table => "relationships",
    :foreign_key => "publisher_id",
    :association_foreign_key => "follower_id")


  def self.from_omniauth(auth, signed_in_user=nil)
    if auth[:provider] == "twitter"
      user = signed_in_user || User.find_by_email(auth.info.nickname + "@twitter.com")
    
    else
      user = signed_in_user || User.find_by_email(auth.info.email)
    end 

    if user 
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name if user.name.blank?
      user.profile_picture = auth.info.image if user.image.blank?
      user.save
        if auth.provider == "facebook"
          user.facebook_token = auth.credentials.token
        end
  
      user
    else
      if auth[:provider] == "twitter"
        where(auth.slice(:provider, :uid)).first_or_create do |user|
    
          user.provider = auth.provider
          user.uid = auth.uid
          user.name = auth.info.name
          user.email = auth.info.nickname + "@twitter.com"
          user.profile_picture = auth.info.profile_picture
          user.password = Devise.friendly_token[0,20]
          user.facebook_token = auth.credentials.token
        end
      else 
        where(auth.slice(:provider, :uid)).first_or_create do |user|
    
          user.provider = auth.provider
          user.uid = auth.uid
          user.name = auth.info.name
          user.email = auth.info.email
          user.profile_picture = auth.info.profile_picture
          user.password = Devise.friendly_token[0,20]
          user.facebook_token = auth.credentials.token
        end
      end
    end 
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.google_data"]
        raise
        user.name = auth.info.name
        user.email = auth.info.email
        user.profile_picture = auth.info.image
      end 
    end
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :image, :name, :bio
  # attr_accessible :title, :body

  mount_uploader :image, UserImageUploader


  has_many :posts
  has_many :votes
  has_and_belongs_to_many(:users,
    :join_table => "relationships",
    :foreign_key => "publisher_id",
    :association_foreign_key => "follower_id")


  def self.find_for_google_oauth2(auth, signed_in_user=nil)
    if user = signed_in_user || User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name if user.name.blank?
      user.image = auth.info.image if user.image.blank?
      user.save
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]

      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.google_data"]
        user.name = auth.info.name
        user.email = auth.info.email
        user.image = auth.info.image
      end 
    end
  end
end

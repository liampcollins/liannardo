class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :image, :name, :bio
  # attr_accessible :title, :body
  # mount_uploader :image, ImageUploader

  has_many :posts
  has_many :votes
  has_and_belongs_to_many(:users,
      :join_table => "relationships",
      :foreign_key => "publisher_id",
      :association_foreign_key => "follower_id")


end

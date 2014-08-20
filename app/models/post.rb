class Post < ActiveRecord::Base
  attr_accessible :content, :user_id, :repost_id

  belongs_to :user
  has_many :votes
  has_one :repost, class_name: "Post"


end

class Post < ActiveRecord::Base
  require 'obscenity/active_model'

  attr_accessible :content, :user_id, :repost_id

  belongs_to :user
  has_many :votes
  has_one :repost, class_name: "Post"

  validates :content,  obscenity: { sanitize: true, replacement: :stars }, length: { in: 1..141}

end

class Post < ActiveRecord::Base
  require 'obscenity/active_model'

  attr_accessible :content, :user_id, :repost_id, :sentiment, :sentiment_prob

  belongs_to :user
  has_many :votes
  has_one :repost, class_name: "Post"

  default_scope :order => 'created_at DESC'

  validates :content,  obscenity: { sanitize: true, replacement: "woopsy" }


end

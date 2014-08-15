class Vote < ActiveRecord::Base
  attr_accessible :sentiment, :user_id, :post_id

  belongs_to :user
  belongs_to :post
end

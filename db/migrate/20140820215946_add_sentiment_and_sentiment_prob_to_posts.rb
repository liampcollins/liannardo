class AddSentimentAndSentimentProbToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sentiment, :boolean
    add_column :posts, :sentiment_prob, :integer
  end
end

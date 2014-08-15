class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships, :force => true, :id => false do |t|
      t.integer :follower_id, null: false
      t.integer :publisher_id, null: false

      t.timestamps
    end
  end
end

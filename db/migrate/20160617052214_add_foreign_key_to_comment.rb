class AddForeignKeyToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :user_id, :serial
  	add_foreign_key :comments, :users,  column: :user_id
  	add_column :comments, :topic_id, :serial
  	add_foreign_key :comments, :topics,  column: :topic_id
  end
end

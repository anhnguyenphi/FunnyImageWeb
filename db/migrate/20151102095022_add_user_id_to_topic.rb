class AddUserIdToTopic < ActiveRecord::Migration
  def change
  	add_column :topics, :user_id, :serial
  	add_foreign_key :topics, :users,  column: :user_id
  end
end

class AddCommentToTopic < ActiveRecord::Migration
  def change
  	add_column :comments, :user_id, :serial
  	add_column :comments, :topic_id, :serial
  end
end

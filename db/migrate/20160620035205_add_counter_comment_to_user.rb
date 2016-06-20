class AddCounterCommentToUser < ActiveRecord::Migration
  def self.up
  	add_column :users, :comments_count, :integer, :default => 0
  	User.find_each { |user| User.reset_counters(user.id, :comments) }
  end

  def self.down
  	remove_column :users, :comments_count
  end
end

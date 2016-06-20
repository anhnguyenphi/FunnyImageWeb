class AddCounterCommentToTopic < ActiveRecord::Migration
  def self.up
  	add_column :topics, :comments_count, :integer, :default => 0
  	Topic.find_each { |topic| Topic.reset_counters(topic.id, :comments) }
  end

  def self.down
  	remove_column :topics, :comments_count
  end
end

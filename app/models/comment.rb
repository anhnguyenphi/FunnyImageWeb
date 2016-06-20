class Comment < ActiveRecord::Base
	belongs_to :user, counter_cache: true
	belongs_to :topic, counter_cache: true
	validates :content, presence: true
end

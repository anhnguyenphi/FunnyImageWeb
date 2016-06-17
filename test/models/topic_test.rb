require 'test_helper'

class TopicTest < ActiveSupport::TestCase

	def setup
		@topic = Topic.new(title: "title")
	end
  
	test "topic title blank" do
		@topic.title = "	"
		assert_not @topic.valid?
	end

end

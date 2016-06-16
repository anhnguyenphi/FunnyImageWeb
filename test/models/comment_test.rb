require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@comment = Comment.new
  end
  test "should be valid" do
  	@comment.content = "	"
  	assert @comment.valid?
  end
end

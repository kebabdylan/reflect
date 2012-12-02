require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  
  
  test "getforentry" do
    assert_not_nil comments
    assert_equal 5, comments.count
  end
  
end

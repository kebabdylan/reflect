require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "link" do 
    entry = entries(:complete)
    links = entry.link
    assert_equal 'View Entry', links[:label]
    assert_equal 'view', links[:action] 
    
    
    i_entry = entries(:incomplete)
    i_links = i_entry.link
    assert_equal 'Complete this entry now', i_links[:label]
    assert_equal 'update', i_links[:action]
  end

end

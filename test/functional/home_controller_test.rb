require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    session[:userid] = 1
    session[:is_admin] = true
  end


  test "should get index" do
    get :index
    
    assert_response :success
    assert_not_nil assigns(@user)
    assert_not_nil assigns(@active_entries)
    assert_not_nil assigns(@comments)    
    #assert_not_nil assigns(:comments)
  end




end

require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get svn" do
    get :svn
    assert_response :success
  end

  test "should get resume" do
    get :resume
    assert_response :success
  end

end

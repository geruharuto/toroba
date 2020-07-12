require 'test_helper'

class DirectmessageControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get directmessage_destroy_url
    assert_response :success
  end

  test "should get create" do
    get directmessage_create_url
    assert_response :success
  end

end

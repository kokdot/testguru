require 'test_helper'

class FeedBacksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get feed_backs_show_url
    assert_response :success
  end

  test "should get update" do
    get feed_backs_update_url
    assert_response :success
  end

end

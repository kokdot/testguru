require 'test_helper'

class BagesUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bages_users_index_url
    assert_response :success
  end

end

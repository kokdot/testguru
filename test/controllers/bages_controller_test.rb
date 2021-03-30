require 'test_helper'

class BagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bages_index_url
    assert_response :success
  end

  test "should get new" do
    get bages_new_url
    assert_response :success
  end

  test "should get create" do
    get bages_create_url
    assert_response :success
  end

  test "should get show" do
    get bages_show_url
    assert_response :success
  end

  test "should get edit" do
    get bages_edit_url
    assert_response :success
  end

end

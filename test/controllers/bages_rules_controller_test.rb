require 'test_helper'

class BagesRulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bages_rules_index_url
    assert_response :success
  end

  test "should get new" do
    get bages_rules_new_url
    assert_response :success
  end

  test "should get create" do
    get bages_rules_create_url
    assert_response :success
  end

  test "should get show" do
    get bages_rules_show_url
    assert_response :success
  end

  test "should get edit" do
    get bages_rules_edit_url
    assert_response :success
  end

end

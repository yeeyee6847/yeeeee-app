require "test_helper"

class SpendingTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spending_types_index_url
    assert_response :success
  end

  test "should get new" do
    get spending_types_new_url
    assert_response :success
  end

  test "should get edit" do
    get spending_types_edit_url
    assert_response :success
  end

  test "should get show" do
    get spending_types_show_url
    assert_response :success
  end
end

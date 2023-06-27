require "test_helper"

class ExpenseItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get expense_items_show_url
    assert_response :success
  end

  test "should get new" do
    get expense_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get expense_items_edit_url
    assert_response :success
  end
end

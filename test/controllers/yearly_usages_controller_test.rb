require "test_helper"

class YearlyUsagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yearly_usages_index_url
    assert_response :success
  end

  test "should get new" do
    get yearly_usages_new_url
    assert_response :success
  end

  test "should get edit" do
    get yearly_usages_edit_url
    assert_response :success
  end
end

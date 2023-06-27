require "test_helper"

class DailyStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_statuses_index_url
    assert_response :success
  end

  test "should get new" do
    get daily_statuses_new_url
    assert_response :success
  end

  test "should get edit" do
    get daily_statuses_edit_url
    assert_response :success
  end
end

require "test_helper"

class DailyUsagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get daily_usages_show_url
    assert_response :success
  end
end

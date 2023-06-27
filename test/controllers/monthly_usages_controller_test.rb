require "test_helper"

class MonthlyUsagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get monthly_usages_show_url
    assert_response :success
  end
end

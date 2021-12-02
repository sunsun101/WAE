require "test_helper"

class NotificationTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notification_test_index_url
    assert_response :success
  end

  test "should get send" do
    get notification_test_send_url
    assert_response :success
  end
end

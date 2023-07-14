require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get how_to_channel" do
    get static_pages_how_to_channel_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end

  test "should get approval_request" do
    get static_pages_approval_request_url
    assert_response :success
  end
end

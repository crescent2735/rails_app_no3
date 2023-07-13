require "test_helper"

class GameRecruitmentControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get game_recruitment_new_url
    assert_response :success
  end
end

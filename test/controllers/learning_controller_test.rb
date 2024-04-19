require "test_helper"

class LearningControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    log_in_as(@user)
  end
  
  test "should get dashboard" do
    get learning_dashboard_url
    assert_response :success
  end

  test "should get skills" do
    get learning_skills_url
    assert_response :success
  end
end

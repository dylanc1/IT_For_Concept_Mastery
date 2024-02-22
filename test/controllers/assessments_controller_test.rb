require "test_helper"

class AssessmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get study_activities" do
    get assessments_study_activities_url
    assert_response :success
  end

end

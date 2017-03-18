require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:karam)
  end

  test "should get new" do
    log_in_as(@user)
    get projects_new_url
    assert_response :success
  end

end

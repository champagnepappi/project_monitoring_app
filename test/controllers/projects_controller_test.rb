require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:karam)
    @user2 = users(:glorious)
  end

  test "should get new" do
    log_in_as(@user)
    get projects_new_url
    assert_response :success
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Project.count' do
      post projects_path, params: {
        project: {
          title: "car tracker",
          description: "just some hell alot of description"

        }
      }
      assert_redirected_to login_path
      assert_not flash.empty?
      assert flash[:danger], "Please login to continue"
    end
  end

end

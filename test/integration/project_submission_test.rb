require 'test_helper'

class ProjectSubmissionTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:karam)
    @user2 = users(:glorious)
  end

  test "invalid project submission" do
    log_in_as(@user)
    get new_project_path
    post projects_path, params: {
      project: {
        title: "",
        description: ""
      }
    }
    assert_template 'projects/new'
  end

  test "valid project submission" do
    log_in_as(@user)
    get new_project_path
    post projects_path, params: {
      project: {
        title: "chat application",
        description: "wehwrijwjrwjjgwjgwi9u3y49qhqrgdjjfcvsfbsdiuiriueueiriw"
      }
    }
    assert_redirected_to @user 
    assert_not flash.empty?
    assert_equal flash[:success], "Project successfully submitted"
  end

end

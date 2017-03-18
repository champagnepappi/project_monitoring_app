require 'test_helper'

class ProjectSubmissionTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:karam)
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
end

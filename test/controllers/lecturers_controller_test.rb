require 'test_helper'

class LecturersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @lec = lecturers(:ritah)
  end

  test "should get new" do
    get lecturers_new_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_lecturer_path(@lec)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

end

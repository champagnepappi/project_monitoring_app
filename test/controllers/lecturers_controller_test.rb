require 'test_helper'

class LecturersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @lec = lecturers(:ritah)
    @lec2 = lecturers(:naish)
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

  test "should redirect update when not logged in" do
    patch lecturer_path(@lec), params: {
      lecturer: {
        first_name: @lec.first_name,
        email: @lec.email
      }
    }
    assert_redirected_to login_path
    assert_not flash.empty?
  end

  test "redirect edit when logged in as wrong lecturer" do
    log_in_lec(@lec2)
    get edit_lecturer_path(@lec)
    assert flash.empty?
    assert_redirected_to root_path
  end

  test "redirect update when wrong lecturer logs in" do
    log_in_lec(@lec2)
    patch lecturer_path(@lec), params: {
      lecturer: {
        first_name: @lec.first_name,
        email: @lec.email
      }
    }
    assert_redirected_to root_path
  end
end

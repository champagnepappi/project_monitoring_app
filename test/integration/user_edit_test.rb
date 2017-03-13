require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:karam)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
          first_name: "",
          last_name: "angrlo",
          email: "dida@g.com",
          reg_no: "COM/0011/13",
          gender: "Male",
          department: "IT",
          course_taken: "Computer Science",
          password: "",
          password_confirmation: "qwertyu"
      }
    }
    assert_template 'users/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
          first_name: "mike",
          last_name: "angrlo",
          email: "dida@g.com",
          reg_no: "COM/0011/13",
          gender: "Male",
          department: "IT",
          course_taken: "Computer Science",
          password: "qwertyu",
          password_confirmation: "qwertyu"
      }
    }
    assert_not flash.empty?
    assert_redirected_to @user
  end
end

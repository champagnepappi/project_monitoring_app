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
          first_name = "Karam",
          last_name = "Kinoti",
          email = "dida@g.com",
          reg_no = "COM/0011/13",
          gender = "Male",
          department = "IT",
          course_taken = "Computer Science"
    patch user_path(@user), params: {
      user: {
          first_name: first_name,
          last_name: last_name,
          email: email,
          reg_no: reg_no,
          gender: gender,
          department: department,
          course_taken: course_taken,
          password: "qwertyu",
          password_confirmation: "qwertyu"
      }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.last_name , last_name
    assert_equal @user.email , email
    assert_equal @user.reg_no, reg_no
    assert_equal @user.gender, gender
    assert_equal @user.department, department
    assert_equal @user.course_taken, course_taken
  end
end

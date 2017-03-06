require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          first_name: "",
          last_name: "",
          email: "dida@g.com",
          reg_no: "COM/0311/13",
          gender: "Male",
          department: "IT",
          course_taken: "IT",
          password: "eqedq",
          password_confirmation: ""

        }
      }
    end
    assert_template 'users/new'
  end

  test "valid signup" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: {
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
    end
    # assert_redirected_to User.last
    # assert_not flash.empty?
    # assert is_logged_in?
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
  end
end

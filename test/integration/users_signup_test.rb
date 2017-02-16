require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
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
end

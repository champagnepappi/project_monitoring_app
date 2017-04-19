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
    assert_not user.activated?
    #login before activation
    log_in_as(user)
    assert_not is_logged_in?
    #invalid activation_token
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?
    #valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: "defwrong")
    assert_not is_logged_in?
    #valid activation_token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end

require 'test_helper'

class LecSignupTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end
  
  test "invalid signup" do
    get new_lecturer_path
    assert_no_difference 'Lecturer.count' do
      post lecturers_path, params: {
        lecturer: {
          first_name: "",
          last_name: "",
          email: "anon@gmail.com",
          password: "1234567",
          password_confirmation: "1234567"
        }
      }
    end
    assert_template 'lecturers/new'
  end

  test "valid signup" do
    get new_lecturer_path
    assert_difference 'Lecturer.count', 1 do
      post lecturers_path, params: {
        lecturer: {
          first_name: "hailey",
          last_name: "steinfield",
          email: "haly@g.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    lec = assigns(:lec)
    assert_not lec.activated?
    #login before activation
    log_in_as(lec)
    assert_not is_logged_in?
    #invalid activation token
    get edit_account_activation_path("invalid")
    assert_not is_logged_in?
    #valid token, wrong email
    get edit_account_activation_path(lec.activation_token, email: "dqwrq")
    assert_not is_logged_in?
    #valid activation token
    get edit_account_activation_path(lec.activation_token, lec_email: lec.email)
    assert lec.reload.activated?
    follow_redirect!
    assert_template 'lecturers/show'
    assert is_logged_in?
  end
end

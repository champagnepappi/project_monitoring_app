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
  end
end

require 'test_helper'

class LecSignupTest < ActionDispatch::IntegrationTest
  
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
end

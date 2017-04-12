require 'test_helper'

class LecLoginTestTest < ActionDispatch::IntegrationTest
  def setup
    @lec = lecturers(:ritah)
  end

  test "login with invalid info" do
   get login_path 
   assert_template 'sessions/new'
   post login_path, params: {
     session: {
       email: "",
       password: ""
     }
   }
   assert_template 'sessions/new'
   assert_not flash.empty?
   get root_path
   assert flash.empty?
  end

  test "login with valid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {
      session: {
        email: @lec.email,
        password: 'password'
      }
    }
    assert_redirected_to @lec
    follow_redirect!
    assert_template 'lecturers/show'
  end

end

require 'test_helper'

class LecLoginTestTest < ActionDispatch::IntegrationTest
  def setup
    @lec = lecturers(:naish)
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
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", lecturer_path(@lec)
    assert_select "a[href=?]", logout_path
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", lecturer_path(@lec),count: 0
    assert_select "a[href=?]", logout_path, count: 0
    
  end

end

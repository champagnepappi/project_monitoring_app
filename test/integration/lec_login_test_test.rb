require 'test_helper'

class LecLoginTestTest < ActionDispatch::IntegrationTest
  def setup
    @lec = lecturers(:naish)
    @admin = lecturers(:ritah)
  end

  test "login with invalid info" do
   get loginlec_path 
   post loginlec_path, params: {
     session_lec: {
       email: "",
       password: ""
     }
   }
   assert_not flash.empty?
   assert_equal flash[:danger], "Invalid email/password combination"
   get root_path
   assert flash.empty?
  end

  test "login with valid info" do
    get loginlec_path
    post loginlec_path, params: {
      session_lec: {
        email: @lec.email,
        password: 'password'
      }
    }
    assert_redirected_to @lec
    follow_redirect!
    assert_template 'lecturers/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", loginlec_path, count: 0
    assert_select "a[href=?]", lecturer_path(@lec)
    assert_select "a[href=?]", logout_path
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", loginlec_path
    assert_select "a[href=?]", lecturer_path(@lec),count: 0
    assert_select "a[href=?]", logout_path, count: 0
    
  end


end

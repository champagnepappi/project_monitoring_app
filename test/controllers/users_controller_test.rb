require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:karam)
    @user2 = users(:glorious)
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: {
      user: {
        first_name: @user.first_name,
        email: @user.email
      }
    } 
    assert_redirected_to login_path
  end

  test "redirect edit when logged in as wrong user" do
    log_in_as(@user2)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_path
  end

  test "redirect index if not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "redirect update when wrong user logs in" do
    log_in_as(@user2)
    patch user_path(@user), params: {
      user: {
        first_name: @user.first_name,
        email: @user.email
      }
    } 
    assert_redirected_to root_path
    
  end

end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Justin",last_name: "Anonymous", email: "dummy@gmail.com",
                   reg_no: "COM/0040/13", gender: "male", department: "IT" )
  end

  test "first_name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
   @user.email = " " 
   assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end

end

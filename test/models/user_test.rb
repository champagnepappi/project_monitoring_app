require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Justin",last_name: "Anonymous", email: "dummy@gmail.com",
                   reg_no: "COM/0040/13", gender: "male", department: "IT", course_taken: "IT" )
  end

  test "first_name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end
end

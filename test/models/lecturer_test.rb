require 'test_helper'

class LecturerTest < ActiveSupport::TestCase
  def setup
    @lec = Lecturer.new(first_name: "Daniel", last_name: "Jack",
                  email: "daniel@gmail.com")
  end

  test "first name should be present" do
    @lec.first_name = ""
    assert_not @lec.valid?
  end

  test "email should be present" do
    @lec.email = ""
    assert_not @lec.valid?
  end
end

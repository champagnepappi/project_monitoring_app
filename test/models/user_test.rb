require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Just Anonymous", email: "dummy@gmail.com")
  end
end

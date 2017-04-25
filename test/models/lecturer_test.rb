require 'test_helper'

class LecturerTest < ActiveSupport::TestCase
  def setup
    @lec = Lec.new(first_name: "Daniel", last_name: "Jack",
                  email: "daniel@gmail.com")
  end
end

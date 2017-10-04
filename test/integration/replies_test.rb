require 'test_helper'

class RepliesTest < ActionDispatch::IntegrationTest

  test "invalid reply submission" do
    assert_no_difference 'Reply.count' do
      post replies_path, params: {
        reply: {
          content: ""
        }
      }
    end
  end
end

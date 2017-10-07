require 'test_helper'

class RepliesTest < ActionDispatch::IntegrationTest
  def setup
    @message = messages(:one)
    @user = users(:karam)
  end

  test "invalid reply submission" do
    assert_no_difference 'Reply.count' do
      post replies_path, params: {
        reply: {
          content: ""
        }
      }
    end
  end

  # test "valid reply submission" do
  #   assert_difference 'Reply.count', 1 do
  #     post replies_path, params: {
  #       reply: {
  #         content: "just some reply"
  #       }
  #     }
  #   end
  # end
end

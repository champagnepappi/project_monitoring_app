require 'test_helper'

class UserMessagesTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:karam)
  end

  test "redirect create if not logged in" do
    assert_no_difference 'Message.count' do
      post messages_path, params: {
        message: {
          content: "This is a simple message"
        }
      }
    end
    assert_redirected_to login_path
    assert_not flash.empty?
  end

  test "invalid message creation" do
    assert_no_difference 'Message.count' do
      post messages_path, params: {
        message: {
          content: ""
        }
      }
    end
    assert_not flash.empty?
    assert flash[:danger], 'There was a problem submitting message'
  end
end

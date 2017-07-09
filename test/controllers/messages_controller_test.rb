require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:karam)
    @user2 = users(:glorious)
  end
  
  test "should redirected create when not logged in" do
    assert_no_difference 'Message.count' do
      post messages_path, params: {
        message: {
          content: "Just dummy shit"
        }
      }
    end
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Message.count' do
      delete message_path, params: {id: message}
    end
    assert_redirected_to root_url
  end
end

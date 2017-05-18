require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should redirected create when not logged in" do
    assert_no_difference 'Message.count' do
      post messages_path, params: {
        message: {
          content: "Just dummy shit"
        }
      }
    end
  end
end

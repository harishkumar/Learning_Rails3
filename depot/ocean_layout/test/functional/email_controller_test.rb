require 'test_helper'

class EmailControllerTest < ActionController::TestCase
  test "should get send_email" do
    get :send_email
    assert_response :success
  end

end

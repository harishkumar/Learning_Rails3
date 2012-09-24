require 'test_helper'

class BuyerControllerTest < ActionController::TestCase
  test "should get catalog" do
    get :catalog
    assert_response :success
  end

end

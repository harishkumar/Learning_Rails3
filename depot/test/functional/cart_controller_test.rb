require 'test_helper'

class CartControllerTest < ActionController::TestCase
  test "should get my_cart_page" do
    get :my_cart_page
    assert_response :success
  end

end

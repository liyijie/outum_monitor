require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get version" do
    get :version
    assert_response :success
  end

end

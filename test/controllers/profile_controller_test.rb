require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get userdetail" do
    get profile_userdetail_url
    assert_response :success
  end

end

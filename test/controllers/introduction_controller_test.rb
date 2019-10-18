require 'test_helper'

class IntroductionControllerTest < ActionDispatch::IntegrationTest
  test "should get join" do
    get introduction_join_url
    assert_response :success
  end

  test "should get consulting" do
    get introduction_consulting_url
    assert_response :success
  end

end

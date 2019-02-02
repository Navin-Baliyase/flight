require 'test_helper'

class AirplanesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get airplanes_new_url
    assert_response :success
  end

  test "should get index" do
    get airplanes_index_url
    assert_response :success
  end

end

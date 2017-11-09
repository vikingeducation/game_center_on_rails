require 'test_helper'

class HiLoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hi_lo_new_url
    assert_response :success
  end

  test "should get make_move" do
    get hi_lo_make_move_url
    assert_response :success
  end

end

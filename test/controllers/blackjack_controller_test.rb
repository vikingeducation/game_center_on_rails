require 'test_helper'

class BlackjackControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get blackjack_new_url
    assert_response :success
  end

  test "should get hit" do
    get blackjack_hit_url
    assert_response :success
  end

  test "should get stand" do
    get blackjack_stand_url
    assert_response :success
  end

end

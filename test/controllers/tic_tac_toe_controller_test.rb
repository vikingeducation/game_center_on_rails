require 'test_helper'

class TicTacToeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tic_tac_toe_new_url
    assert_response :success
  end

  test "should get make_move" do
    get tic_tac_toe_make_move_url
    assert_response :success
  end

end

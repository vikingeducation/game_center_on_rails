require 'test_helper'

class ConnectFourGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get connect_four_games_new_url
    assert_response :success
  end

end

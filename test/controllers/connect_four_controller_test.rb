require 'test_helper'

class ConnectFourControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get connect_four_new_url
    assert_response :success
  end

  test "should get index" do
    get connect_four_index_url
    assert_response :success
  end

end

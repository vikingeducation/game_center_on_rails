class ConnectFourController < ApplicationController
  include ConnectFourHelper
  def new
    @board = Board.new
  end
end

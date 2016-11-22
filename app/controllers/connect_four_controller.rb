class ConnectFourController < ApplicationController

  def new
    @board = Board.new
  end
end

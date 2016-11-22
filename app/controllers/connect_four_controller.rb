class ConnectFourController < ApplicationController
  def new
    session = nil

    @board = GameBoard.new
    # instantiate Board.new
  end

  def drop_piece

  end

  def game_over

  end
end

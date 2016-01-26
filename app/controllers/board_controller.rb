class BoardController < ApplicationController

  # session[:board] = board
  # Board.new(session)

  def index
    @board = Board.new
    session[:board] = board.session
  end

  def edit
    board.place_piece(column)
  end

  def update

  end
end

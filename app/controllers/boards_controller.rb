class BoardsController < ApplicationController

  # include BoardHelper

  # session[:board] = board
  # Board.new( session )

  def index
    # session[:board] = @board.session
    @board = Board.new( session )
  end

  def edit
    board.place_piece(column)
  end

  def update
    # ridirect.to 
  end

end

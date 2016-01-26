class BoardsController < ApplicationController

  # include BoardHelper

  # session[:board] = board
  # Board.new( session )

  def index
    # session[:board] = @board.session
    @board = Board.new( session )
  end

  def create
    redirect_to edit_board_path
  end

  def edit
    @board = Board.new( session )
    @board.place_piece(params[:column])
  end

  def update
    
  end

end

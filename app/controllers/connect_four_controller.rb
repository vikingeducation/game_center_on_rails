class ConnectFourController < ApplicationController

  include ConnectFourHelper

  def new
    @board = Board.new
    session[:board] = @board.board_array
    redirect_to connect_four_index_path
  end

  def index
    @board = Board.new(session[:board])
  end

  def create # modify the board based on a move
    @board = Board.new(session[:board])
    @board.add_piece(params[:move].to_i, 'X')
    session[:board] = @board.board_array
    redirect_to connect_four_index_path
  end

end

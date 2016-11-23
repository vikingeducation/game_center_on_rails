class ConnectFourController < ApplicationController

  include ConnectFourHelper

  def new
    board = Board.new
    @board_array = board.board_array
    session[:board] = @board_array
    session[:game_over] = false
    redirect_to connect_four_index_path
  end

  def index
    board = Board.new(session[:board])
    @board_array = board.board_array
  end

  def create # modify the board based on a move
    board = Board.new(session[:board])

    board.add_piece(params[:move].to_i, 'X')

    if board.win?
      session[:game_over] = true
      flash[:notice] = "You've won!"
      @board_array = board.board_array
      session[:board] = board.board_array
      redirect_to connect_four_index_path
    else
      board.add_piece(board.valid_move, 'O')
      if board.win?
        session[:game_over] = true
        flash[:notice] = "You've lost!"
      end

      @board_array = board.board_array
      session[:board] = board.board_array
      redirect_to connect_four_index_path
    end
  end
end

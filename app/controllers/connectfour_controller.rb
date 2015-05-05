class ConnectfourController < ApplicationController
  def new
    @game = ConnectFour.new.board
    save_board

    render :game_board
  end

  def drop_piece
    @move = ConnectFour.new(get_board)
    @move.make_move(get_column)
    @move.tachikoma_move
    @game = @move.board
    save_board

    render :game_board
  end

  def save_board
    session[:saved_board] = @game
  end

  def get_board
    session[:saved_board]
  end

  def get_column
    params[:move].to_i
  end
end

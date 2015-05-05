class ConnectfourController < ApplicationController
  def new
    @game = ConnectFour.new.board
    save_board

    render :game_board
  end

  def drop_piece
    @game = get_board
    save_board

    render :game_board
  end

  def save_board
    session[:saved_board] = @game
  end

  def get_board
    session[:saved_board]
  end
end

class BoardsController < ApplicationController

  def show
    session[:player] = "X" if session[:player].nil?
    @board = Board.new(session[:layout]) || Board.new
  end

  def update
    @board = Board.new(session[:layout])
    unless last_move = @board.add_piece(params[:column].to_i, session[:player])
      flash[:danger] = "Invalid move."
      redirect_to root_path
    else
      session[:layout] = @board.layout
      if @board.four_connected?(last_move)
        redirect_to game_over_path
      else
        session[:player] == "X" ? session[:player] = "O" : session[:player] = "X"
        redirect_to root_path
      end
    end
  end
end

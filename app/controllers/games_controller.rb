class GamesController < ApplicationController
  include GamesHelper
  def index
    if session["game_over"] == true
      @game_over = true
      session["game_over"] = false
      session["board"] = new_board
    end
    session["board"] ||= new_board
    @board = session["board"]
  end

  def move
    board = session["board"]

    flash[:notice] = "Illegal move, try again." unless play_move(params[:col].to_i, board)

    if check_winner(board)
      flash[:notice] = "Player #{check_winner(board) + 1} wins!"
      session["game_over"] = true
    end
    redirect_to index_path
  end

end

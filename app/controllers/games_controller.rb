class GamesController < ApplicationController
  include GamesHelper
  def index
    @game_over = session["game_over"]
    session["players"] ||= 1
    session["board"] ||= new_board
    @board = session["board"]
  end

  # This is the first page a user see
  def new
    if params["player_count"]
      if params["player_count"].to_i == 1
        session["players"] = 1
      else
        session["players"] = 2
      end
      session["board"] = new_board
      session["game_over"] = false
      redirect_to index_path
    end
  end

  def move
    board = session["board"]
    play(params[:col].to_i, board)

    redirect_to index_path
  end

end

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
      if params["player_count"] == 1
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
    unless play_move(params[:col].to_i, board)
    	flash[:notice] = "Illegal move, try again."
    else
    	if check_winner(board)
      		flash[:notice] = "Player #{check_winner(board) + 1} wins!"
      		session["game_over"] = true
      	else
      		ai_move = AI.new(board).move
      		play_move(ai_move, board)
      		if check_winner(board)
      			flash[:notice] = "Player #{check_winner(board) + 1} wins!"
      			session["game_over"] = true
      		end
      	end
    end
    	redirect_to index_path
  end

end

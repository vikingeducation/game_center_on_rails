#require '../models/board'

class ConnectfourController < ApplicationController

  def index
    session['game_board'] = {} unless session['game_board']
    @board = Board.new(session['game_board'])  
  end

  def create
    @board = Board.new
    @board.game_board = session['game_board'] 

    move = params[:col]
    
    @board.add_piece(move, :x)

    session['game_board'] = @board.game_board

    redirect_to root_path
  end

end

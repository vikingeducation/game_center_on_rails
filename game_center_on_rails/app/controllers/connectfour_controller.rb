require "better_errors"

class ConnectfourController < ApplicationController

  def index
    session['game_board'] = {} unless session['game_board']
    @board = Board.new(session['game_board'])  

    if @board.winning_combination?
      flash.now "You won!"
    end



  end

  def create
    @board = Board.new
    @board.game_board = session['game_board'] 

    move = params[:col]
    
    @board.add_piece(move, :x)
    @board.add_piece((1..7).to_a.sample, :o)


    session['game_board'] = @board.game_board

    redirect_to root_path
  end

  def new
    session.clear
    redirect_to root_path
  end

end

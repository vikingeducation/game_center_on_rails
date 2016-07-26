require_relative "../models/classes/board"

class GameController < ApplicationController

  def home
    session['color'] ||= "red"
    @board = session['board'] || Board.new.play_field
    session['board'] = @board
  end

  def play
    move = params[:move].to_i
    color = session[:color]
    board = board.new(session['board'])
    if board.valid_move(move, color)
      board.add_piece(move, color)
      flash[:success] = "Your peice has been added!"
      session['color'] = session['color'] == "red" ? "black" : "red"
    else
      flash[:danger] = "That move is invalid... please try again"
    end
    redirect_to :home
  end

end

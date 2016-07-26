class GameController < ApplicationController

  def home
    session['color'] ||= "red"
    @board = session['board'] || Board.new.play_field
    session['board'] = @board
  end

  def play
    move = params[:move].to_i
    color = session[:color]
    board = Board.new(session['board'])
    if board.valid_move?(move, color)
      board.add_piece(move, color)
      flash[:success] = "Your peice has been added!"
      session['color'] = session['color'] == "red" ? "black" : "red"
      session['board'] = board.play_field
    else
      flash[:danger] = "That move is invalid... please try again"
    end
    #if board has victory
    redirect_to board.has_victory? ? :end : :home
  end

end

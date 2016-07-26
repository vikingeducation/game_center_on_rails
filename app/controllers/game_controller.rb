class GameController < ApplicationController

  def home
    session['color'] ||= "R"
    @board = session['board'] || Board.new.play_field
    session['board'] = @board
  end

  def play
    move = params[:move].to_i
    @color = session[:color]
    @board = Board.new(session['board'])
    if @board.valid_move?(move, @color)
      @board.add_piece(move, @color)
      flash[:success] = "Your piece has been added!"
      session['color'] = session['color'] == "R" ? "B" : "R"
      session['board'] = @board.play_field
      if @board.has_victory? || @board.is_draw?
        render :end
      else
        redirect_to :home
      end
    else
      flash[:danger] = "That move is invalid... please try again"
      redirect_to :home
    end
  end

  def reset
    session.clear
    redirect_to :home
  end

end

# (4) Make reset button on end page.
# (5) Make flash messages appear.

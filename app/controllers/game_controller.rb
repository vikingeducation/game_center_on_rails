class GameController < ApplicationController

  def home
    session['color'] ||= "R"
    @board = session['board'] || Board.new.play_field
    session['board'] = @board
  end

  def play
    move = get_session
    if @board.valid_move?(move, @color)
      update_session(move)
      direct_to_view
    else
      flash[:danger] = "That move is invalid... please try again"
      redirect_to :home
    end
  end

  def reset
    session.clear
    redirect_to :home
  end

  private

    def get_session
      @color = session[:color]
      @board = Board.new(session['board'])
      params[:move].to_i
    end

    def direct_to_view
      if @board.has_victory?
        winner = @color == "B" ? "Black" : "Red"
        flash.now[:info] = "The game has ended. #{winner} is the winner."
        render :end, locals: { board: @board.play_field }
      elsif @board.is_draw?
        flash.now[:info] = "The game ended in a draw."
        render :end, locals: { board: @board.play_field }
      else
        flash[:success] = "Your piece has been added!"
        redirect_to :home
      end
    end

    def update_session(move)
      @board.add_piece(move, @color)
      session['color'] = session['color'] == "R" ? "B" : "R"
      session['board'] = @board.play_field
    end

end

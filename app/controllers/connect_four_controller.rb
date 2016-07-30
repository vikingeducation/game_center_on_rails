class ConnectFourController < ApplicationController

  def new
    session[:player] = "X"
    @board = Board.new
    session[:grid] = @board.grid
  end

  def drop_piece
    @board = Board.new(session[:grid])
    @board.drop_piece(params[:column].to_i, session[:player])
    
    if @board.victory?
      @message = "#{session[:player]} wins!"
    elsif @board.draw?
      @message = "It's a draw"
    end
    
    save_session(@board.grid)
  end

  private

  def save_session(grid)
    session[:player] == "X" ? session[:player] = "O" : session[:player] = "X"
    session[:grid] = grid
  end
end

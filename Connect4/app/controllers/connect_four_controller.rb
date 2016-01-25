class ConnectFourController < ApplicationController

  def new
    if session[:board]
      board = JSON.parse(session[:board])
      game = ConnectFour(board)
    else
      game = ConnectFour.new
      board = game.board.board
    end
    session[:board] = game.board.board.to_json
    @board = board 
  end

  def drop_piece
     #session[:game] = ConnectFou
  end  
end

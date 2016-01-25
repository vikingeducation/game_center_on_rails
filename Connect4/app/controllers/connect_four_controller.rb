class ConnectFourController < ApplicationController

  def new
    unless session[:player]
      session[:player] = "player1"
    end  
    if session[:board]
      board = JSON.parse(session[:board])
      game = ConnectFour.new(board,session[:player])
    else
      game = ConnectFour.new(nil,session[:player])
      game.board.setup
      board = game.board.board
    end
    session[:board] = game.board.board.to_json
    @board = board 
  end

  def drop_piece
    board = JSON.parse(session[:board])
    game = ConnectFour.new(board)
    

  end  
end

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
    player = session[:player]
    game = ConnectFour.new(board,player)
    column = params[:column].to_i

    if player == "player_1"
      unless game.board.win?(game.player_1.row, game.player_1.column) || game.board.draw?(game.player_1.row, game.player_1.column)
        game.player_1.add_piece(column,game.board)
      end
    else
      unless game.board.win?(game.player_2.row, game.player_1.column) || game.board.draw?(game.player_2.row, game.player_2.column)
        game.player_2.add_piece(column,game.board)
      end
    end 

    session[:board] = game.board.board.to_json
    session[:player] = game.switch_player
    redirect_to '/'

  end

  def new_game
    session[:board] = nil
    session[:player] = nil
    redirect_to '/'
  end  
end

require 'json'

class ConnectFourGamesController < ApplicationController

  def new
    board_state = session[:board]
    @game = ConnectFourGame.new(board: board_state)
  end

  def update
    game = ConnectFourGame.new(board: session[:board])
    player_move = params['column'].to_i
    if game.make_move(player_move)
      session[:board] = game.board
      session[:active_player] = game.active_player
    else
      flash[:error] = "Invalid move!"
    end
    redirect_to connectfour_url
  end

end

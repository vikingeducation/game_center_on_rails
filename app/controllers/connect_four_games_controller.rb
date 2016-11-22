
require 'json'

class ConnectFourGamesController < ApplicationController

  def new
    board_state = cookies[:board]
    # ^ deserialize
    @game = ConnectFourGame.new(board: board_state)
  end

end

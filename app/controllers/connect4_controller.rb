class Connect4Controller < ApplicationController

  def new
    @connect4 = Connect4.new
    session[:board] = @connect4.game_board.game_board
  end

  def edit
    @connect4 = Connect4.new(session[:board])
  end

  def update

  end

end

class ConnectFourController < ApplicationController

  def new
    game = ConnectFour.new
    @board = game.board
    
  end

  def drop_piece
     
  end  
end

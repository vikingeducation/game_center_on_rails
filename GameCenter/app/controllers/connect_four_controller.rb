class ConnectFourController < ApplicationController
  def index 
    @board = Connectfour.new
    @board = @board.board.board
  end 

  def select_create
    redirect_to connect_four_index_path
  end

  def create
    redirect_to connect_four_index_path
  end

end
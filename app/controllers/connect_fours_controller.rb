class ConnectFoursController < ApplicationController

  def new
    @board = ConnectFour.new
    session[:board] = @board.active_board
  end

  def create
    @board = ConnectFour.new(session[:board])
    column = params[:column]
    @board.add_piece(column)
    session[:board]= @board.active_board
  end
end

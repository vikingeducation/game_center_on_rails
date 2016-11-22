class BoardsController < ApplicationController

  def show
    session[:player] = "X" if session[:player].nil?
    @board = Board.new(session[:layout]) || Board.new
  end

  def update
    @board = Board.new(session[:layout])
    @board.add_piece(params[:column].to_i, session[:player])
    session[:layout] = @board.layout
    session[:player] == "X" ? session[:player] = "O" : session[:player] = "X"
    redirect_to root_path
  end


end

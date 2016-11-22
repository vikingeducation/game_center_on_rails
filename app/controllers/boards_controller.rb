class BoardsController < ApplicationController

  def show
    @board = Board.new(session[:layout]) || Board.new
  end

  def update
    @board = Board.new(session[:layout])
    @board.add_piece(params[:column], params[:piece])
    session[:layout] = @board.layout
    redirect_to root_path
  end
end

class BoardsController < ApplicationController
  def index
    @board = Board.new.board
    session[:board] = @board
  end


end

class BoardsController < ApplicationController
  def index
    @board = Board.new(session[:board]).board
  end


end

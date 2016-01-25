class BoardsController < ApplicationController

  def index
    @board = Board.new(session[:board]).board
    @player = true
  end

  def move
    @board_object = Board.new(session[:board])
    if @board_object.valid_move?(params[:column])
      @board_object.place_disk(@player, params[:column])
      @player = !@player
      @board = @board_object.board
      session[:board] = @board
    else

    end
  end
end

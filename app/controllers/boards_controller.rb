class BoardsController < ApplicationController

  def index

    @board = Board.new.board
    session[:board] = @board
    session[:player] = true
    @player = session[:player]
  end

  def move
    @board_object = Board.new(session[:board])
    if @board_object.valid_move?(params[:column])
      @board_object.place_disk(session[:player], params[:column])
      session[:player] = !session[:player]
      @player = session[:player]
      @board = @board_object.board
      session[:board] = @board
    else
      flash.now[:error] = "Invalid move!"
      @board = session[:board]
      @player = session[:player]
      render :move
    end
  end
end

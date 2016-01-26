class BoardsController < ApplicationController

  def index
    @board = Board.new.board
    session[:board] = @board
    session[:player] = true
    @player = session[:player]
    session[:victory] = false
  end

  def move
    @board_object = Board.new(session[:board])
    if @board_object.valid_move?(params[:column])
      @board_object.place_disk(session[:player], params[:column])

      session[:victory] = @board_object.win_conditions?
      @victory = session[:victory]

      session[:player] = !session[:player] unless @victory
      @player = session[:player]
      @board = @board_object.board
      session[:board] = @board
    else
      flash.now[:error] = @board_object.grid_full? ? "Grid is full!" : "Invalid move!"
      @board = session[:board]
      @player = session[:player]
      render :move
    end
    
  end

  private


end

class ConnectFourController < ApplicationController

  # classes:
    # Board


  def new
    @board = Board.new  # render empty board
    @state = @board.state
    session[:state] = @state
    flash.now[:notify] = "Welcome to Connect Four!!"   # show message inviting user to play
    render :game
    # disable full column selection
  end

  def drop_piece
    @board = Board.new(session[:state])   # reinstate a board with state
    @board.make_move(params[:choice])     # update board according to radio
    @winner = @board.winner if @board.game_over?
    @board.comp_move   # computer makes choice
    @winner ||= @board.winner if @board.game_over?
    @state = @board.state
    render :game
  end

  # need to write:
  # game_over
  # win view
end

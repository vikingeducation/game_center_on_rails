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
    redirect_to :win if game_over?(@board.state)  # redirect to win path if win
    @board.comp_move   # computer makes choice
    redirect_to :win if game_over?(@board.state)   # otherwise check to see if computer wins
    render :game
  end

  # need to write:
  # game_over
  # make_move
  # comp_move
  # win view
end

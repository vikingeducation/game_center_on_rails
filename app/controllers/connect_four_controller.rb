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
    if @board.game_over?
      @winner = @board.winner
      redirect_to :win
    end
    @board.comp_move   # computer makes choice
    if @board.game_over? # otherwise check to see if computer wins
      @winner = @board.winner
      redirect_to :win
    end
    render :game
  end

  def win
   render :win
  end

  # need to write:
  # game_over
  # win view
end

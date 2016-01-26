class BoardsController < ApplicationController

  # TODO:
  # before_action :set_schmarticle, only: [:show, :edit, :update, :destroy]

  def show
    @board = Board.new(session)
  end

  def new
    session.clear
    @board = Board.new(session)
  end

  def create
    @board = Board.new(session)

    redirect_to board_path
  end

  def update
    @board = Board.new(session)
    # human move
    @board.make_move(params[:move].to_i, session[:player])
    # check for win
    if @board.win?(@board, @board.get_move_array(params[:move].to_i), "R")
      redirect_to '/'
    else
      # computer move
      @board.make_move(@board.computer_col, "computer")
      # check for win
    end

    redirect_to board_path
  end

  def destroy
  end




end

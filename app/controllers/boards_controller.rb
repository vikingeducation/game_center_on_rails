class BoardsController < ApplicationController

  # TODO:
  # before_action :set_schmarticle, only: [:show, :edit, :update, :destroy]

  def show
    @board = Board.new(session)
  end

  def new
    @board = Board.new(session)
  end

  def create
    @board = Board.new(session)

    redirect_to board_path
  end

  def update
    @board = Board.new(session)
    @board.make_move(params[:move].to_i)

    redirect_to board_path
  end

  def destroy
  end




end

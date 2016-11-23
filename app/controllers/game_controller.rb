class GameController < ApplicationController

  def destroy
  end

  def edit
    @board = session[:board] || Board.new.board
  end

  def update
    @board = session[:board] || Board.new.board
    col = params[:col].to_i
    game = Board.new(grid: @board)
    game.add_piece(col, "X")
    if game.four_in_a_row?
      render :resul, locals: {winner: "Player"}
    end

  end

  def show
  end

  def index
  end

  def create
  end
end

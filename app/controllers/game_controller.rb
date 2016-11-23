class GameController < ApplicationController

  def destroy
    reset_session
    redirect_to game_path
  end

  def edit
    @board = session[:board] || Board.new.grid_array
  end

  def update
    @board = session[:board] || Board.new.grid_array
    grid = Grid.new(preset: @board, rows: 6, columns: 7)
    col = params[:col].to_i + 1
    game = Board.new(grid: grid)

    game.add_piece(col, "X")

    if game.four_in_a_row?
      render :show, locals: {winner: "Player"}
    end

    game.add_piece((2..8).to_a.sample, "O") # ai move

    if game.four_in_a_row?
      render :show, locals: {winner: "Computer"}
    end

    session[:board] = game.grid_array
    redirect_to game_path
  end

  def show
  end

  def index
  end

  def create
  end
end

class GameController < ApplicationController

  def destroy
    reset_session
    redirect_to new_path
  end

  def edit
    session[:current_player] = 'red' if params[:players] == "2"
    @board = session[:board] || Board.new.grid_array
    @current_player = session[:current_player]
  end

  def update
    @board = session[:board] || Board.new.grid_array
    grid = Grid.new(preset: @board, rows: 6, columns: 7)
    col = params[:col].to_i + 1
    game = Board.new(grid: grid)
    player = session[:current_player] || 'red'
    game.add_piece(col, player)


    if game.four_in_a_row?
      session[:winner] = "player #{player}"
    end

    if session[:current_player]
      session[:current_player] = session[:current_player] == 'red' ? 'blue' : 'red'
    else
      game.add_piece((1..7).to_a.sample, "blue") # ai move
      if game.four_in_a_row?
        session[:winner] = "computer"
      end
    end
    session[:board] = game.grid_array
    redirect_to game_path
  end

  def new
  end

  def index
  end
end

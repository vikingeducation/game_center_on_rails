class GamesController < ApplicationController
  include GamesHelper

  def new
  end

  def create
    @game = ConnectFour.new
    save_game(@game)
    redirect_to games_path
  end

  def show
  end

  def index
    game = ConnectFour.new(*load_game)
    # render the board
    render locals: { grid: game.board.grid }
  end

  def edit
  end

  def update
    redirect_to games_path
  end

  def destroy
    redirect_to games_path
  end

  private
    def game_params
      params.require(:game).permit(:board, :player)
    end
end

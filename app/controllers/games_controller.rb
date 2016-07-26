class GamesController < ApplicationController
  def new
  end

  def create
    @game = ConnectFour.new
    redirect_to games_path
  end

  def show
  end

  def index
    @game = ConnectFour.new(game_params)
    # render the board
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

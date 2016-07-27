class GamesController < ApplicationController
  include GamesHelper

  def new
  end

  def create
    @game = ConnectFour.new
    save_game(@game)
    redirect_to games_path
  end

  def index
    game = ConnectFour.new(*load_game)
    # status = game.win?
    render locals: { grid: game.board.grid, status: status}
  end

  def update
    game = ConnectFour.new(*load_game)
    move = params[:move].to_i
    game.make_move(move)
    game.change_player unless game.win?
    save_game(game)
    redirect_to games_path
  end


  # private
  #   def game_params
  #     params.require(:game).permit(:board, :player)
  #   end
end

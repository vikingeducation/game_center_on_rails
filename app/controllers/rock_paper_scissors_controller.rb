class RockPaperScissorsController < ApplicationController
  def index
  end

  def make_move
    game = RockPaperScissors.new(params[:move])
    @message = game.game_result
    render :index
  end
end

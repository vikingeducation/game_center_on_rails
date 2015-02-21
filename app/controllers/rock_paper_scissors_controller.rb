class RockPaperScissorsController < ApplicationController
  def new
  end

  def make_move
    game = RockPaperScissors.new(params[:move])
    @message = game.game_result
    render :result
  end




end

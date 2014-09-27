class RpsController < ApplicationController
  def index
    @playerchoice = session['rpsChoice']
    @game_type = session['game_type']
    start_game
  end

  def create
   session['rpsChoice'] = params[:rpsChoices]
  redirect_to rps_path

  end


  def start_game
    @game = Game.new
    @ai_move = @game.ai_move
    @result = @game.compare_fists(@playerchoice,@ai_move)
  end

  def select

  end
  def select_create
    session['game_type'] = params[:game_type]
    redirect_to rps_path
  end
end

class RpsGameController < ApplicationController

    MOVES = ['rock', 'paper', 'scissors']
    def new
      session[:your_score] ||= 0
      session[:their_score] ||= 0
      session[:player_move] ||= "none yet "
      session[:ai_move] ||= "none yet "
      session[:result] ||= " Please Play "
    end

    def create
      session[:player_move] = params[:choice]
      session[:ai_move] = MOVES.sample
      session[:result] = RpsGame.compare_fists(session[:player_move], session[:ai_move])
      increment_score(session[:result])
      redirect_to new_rps_game_path
    end

  def increment_score(result)
    case result
    when 'WIN!'
      session[:your_score] +=1
    when 'LOSE.'
      session[:their_score] +=1
    else
      # it's a DRAW, no one scores!
    end
  end

end # /class


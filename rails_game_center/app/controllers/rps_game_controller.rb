class RpsGameController < ApplicationController

  MOVES = ['rock', 'paper', 'scissors']
  def new
  end

  def create

    session[:your_score] ||= 0
    session[:their_score] ||= 0

    session[:player_move] = params[:choice]
    session[:ai_move] = MOVES.sample


    session[:result] = compare_fists(session[:player_move], session[:ai_move])


    redirect_to new_rps_game_path
  end

  def compare_fists(player_1_choice, player_2_choice)
    if player_1_choice == 'rock'
      if player_2_choice == 'rock'
        'DRAW.'
      elsif player_2_choice == 'paper'
        'LOSE.'
      else
        'WIN!'
      end
    elsif player_1_choice == 'paper'
      if player_2_choice == 'rock'
        'WIN!'
      elsif player_2_choice == 'paper'
        'DRAW.'
      else
        'LOSE.'
      end
    else
      if player_2_choice == 'rock'
        'LOSE.'
      elsif player_2_choice == 'paper'
        'WIN!'
      else
        'DRAW.'
      end
    end
  end

  # def increment_score(result)
  #   case result
  #   when 'WIN!'
  #   end
  # end

end


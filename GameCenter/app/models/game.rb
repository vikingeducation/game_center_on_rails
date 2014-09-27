class Game
  def initialize(type='single')
    @game_type = type
  end

  def ai_move
    ['R', 'P', 'S'].sample
  end

  def compare_fists(player_1_choice,player_2_choice)
    if player_1_choice == 'R'
      if player_2_choice == 'R'
        'DRAW'
      elsif player_2_choice == 'P'
        'Paper smothers rock. Player 2 wins.'
      else
        'Rock crushes scissors. Player 1 wins.'
      end
    elsif player_1_choice == 'P'
      if player_2_choice == 'R'
        'Paper smothers rock. Player 1 wins.'
      elsif player_2_choice == 'P'
        'DRAW'
      else
        'Scissors cut paper. Player 2 wins.'
      end
    else
      if player_2_choice == 'R'
        'Rock crushes scissors. Player 2 wins.'
      elsif player_2_choice == 'P'
        'Scissors cut paper. Player 1 wins.'
      else
        'DRAW'
      end
    end
  end

end
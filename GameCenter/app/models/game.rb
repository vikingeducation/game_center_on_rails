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
        'Paper smothers rock. You lose!'
      else
        'Rock crushes scissors. You win!'
      end
    elsif player_1_choice == 'P'
      if player_2_choice == 'R'
        'Paper smothers rock. You win!'
      elsif player_2_choice == 'P'
        'DRAW'
      else
        'Scissors cut paper. You lose!'
      end
    else
      if player_2_choice == 'R'
        'Rock crushes scissors. You lose!'
      elsif player_2_choice == 'P'
        'Scissors cut paper. You win!'
      else
        'DRAW'
      end
    end
  end

end
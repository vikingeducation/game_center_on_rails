class RpsGame < ActiveRecord::Base
  def self.compare_fists(player_1_choice, player_2_choice)
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

end

class Rps < ActiveRecord::Base
  def initialize(player_move)
    @player_move = player_move
    @tachikoma_move = tachikoma_choose
  end

  def tachikoma_choose
    @tachikoma_move = %w(ROCK PAPER SCISSORS).sample
  end

  def determine_win
    if @player_move == 'ROCK' && @tachikoma_move == 'SCISSORS' ||
       @player_move == 'PAPER' && @tachikoma_move == 'ROCK' ||
       @player_move == 'SCISSORS' && @tachikoma_move == 'PAPER'
      return "You picked #{@player_move}, Tachikoma picked #{@tachikoma_move}.
              You won!"
    elsif @player_move == 'ROCK' && @tachikoma_move == 'PAPER' ||
          @player_move == 'PAPER' && @tachikoma_move == 'SCISSORS' ||
          @player_move == 'SCISSORS' && @tachikoma_move == 'ROCK'
      return "You picked #{@player_move}, Tachikoma picked #{@tachikoma_move}.
              You lost :("
    else
      return "You and Tachikoma both picked #{@player_move}, it's a draw!"
    end
  end
end

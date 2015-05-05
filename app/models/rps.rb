class Rps < ActiveRecord::Base
  def initialize(player_move)
    @player_move = player_move
    @tachikoma_move = tachikoma_choose
  end

  def tachikoma_choose
    @tachikoma_move = %w(ROCK PAPER SCISSORS).sample
  end

  def won?
    @player_move == 'ROCK' && @tachikoma_move == 'SCISSORS' ||
      @player_move == 'PAPER' && @tachikoma_move == 'ROCK' ||
      @player_move == 'SCISSORS' && @tachikoma_move == 'PAPER'
  end

  def lost?
    @player_move == 'ROCK' && @tachikoma_move == 'PAPER' ||
      @player_move == 'PAPER' && @tachikoma_move == 'SCISSORS' ||
      @player_move == 'SCISSORS' && @tachikoma_move == 'ROCK'
  end

  def determine_win
    if won?
      return "You picked #{@player_move}, Tachikoma picked #{@tachikoma_move}.
              You won!"
    elsif lost?
      return "You picked #{@player_move}, Tachikoma picked #{@tachikoma_move}.
              You lost :("
    else
      return "You and Tachikoma both picked #{@player_move}, it's a draw!"
    end
  end
end

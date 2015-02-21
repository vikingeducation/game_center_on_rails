class RockPaperScissors
  attr_accessor :player_one_wins, :ai_move, :player_move


# Set up the game initially
  def initialize(player_move)
    @player_move = player_move
    @ai_move = ai_move
    pick_winner(@player_move, @ai_move)
  end

  def ai_move
    ["R", "S", "P"].sample
  end

  def pick_winner(move1,move2)
    case
    when move1 == "R" && move2 == "S"
      self.player_one_wins = true
    when move1 == "S" && move2 == "P"
      self.player_one_wins = true
    when move1 == "P" && move2 == "R"
      self.player_one_wins = true
    else
      self.player_one_wins = false
    end
  end

  def is_draw?
    @player_move == @ai_move
  end
end
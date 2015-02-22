class RockPaperScissors
  attr_accessor :player_one_wins, :ai_move, :player_move


# Set up the game initially
  def initialize(player_move)
    @player_one_wins = false
    @player_move = player_move
    @ai_move = ai_move
    pick_winner(@player_move, @ai_move)    
  end

  def game_result
    if is_draw?
      return "The game ended in a draw!"
    elsif @player_one_wins
      return "You win!"
    else
      return "You lose!"
    end
  end

  def ai_move
    ["R", "S", "P"].sample
  end

  def pick_winner(move1,move2)
    case
    when move1 == "R" && move2 == "S"
      @player_one_wins = true
    when move1 == "S" && move2 == "P"
      @player_one_wins = true
    when move1 == "P" && move2 == "R"
      @player_one_wins = true
    else
      @player_one_wins = false
    end
  end

  def is_draw?
    @player_move == @ai_move
  end
end
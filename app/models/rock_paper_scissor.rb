class RockPaperScissor

  attr_reader :player_move, :ai_move

  def initialize(move)
    @player_move = move
    @ai_move = [:rock, :paper, :scissors].sample
  end

  def player_won?
    (player_move == :rock && ai_move == :scissors) ||
    (player_move == :scissors && ai_move == :paper) ||
    (player_move == :paper && ai_move == :rock)
  end

  def ai_won?
    !(player_won? || draw?)
  end

  def draw?
    player_move == ai_move
  end
end

class RockPaperScissor

  attr_reader :player_move, :ai_move

  def initialize(move)
    @player_move = move
    @ai_move = [:rock, :paper, :scissors].sample
  end

  def is_draw?
    player_move == ai_move
  end
end

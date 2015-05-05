class ConnectFour
  attr_reader :board

  def initialize(board = nil)
    @board = board || blank_board
  end

  def blank_board
    Array.new(7) { Array.new(6) }
  end
end

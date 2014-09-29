class Board
  attr_accessor :board

  def initialize(board=nil)
    if board.nil?
      @board = Array.new(7) { Array.new }
    else
      @board = board
    end
  end
end
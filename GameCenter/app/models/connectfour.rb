class Connectfour
  attr_accessor :board
  def initialize(board=nil)
    if board.nil?
      @board = Board.new
    else
      @board = Board.new(@board)
    end
  end
end


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
class ConnectFour
  attr_reader :board

  def initialize(board = nil)
    @board = board || blank_board
  end

  def blank_board
    Array.new(7) { Array.new(6) }
  end

  def tachikoma_move
    column = rand(0..5)
    make_move(column, 'Y')
  end

  def make_move(column, color)
    row = 6
    until @board[row][column] == nil
      row -= 1
    end
    @board[row][column] = color
  end
end

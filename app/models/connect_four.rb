require_relative "board"
require_relative "player"
require_relative "piece"

class ConnectFour
  attr_reader :board, :player

  def initialize(grid = nil, player = "X")
    @player = player
    @board = Board.new(grid) || Board.new
  end

  def win?
    check_win(@board.horizontals) ||
    check_win(@board.verticals) ||
    check_win(@board.rising_diagonals) ||
    check_win(@board.falling_diagonals)
  end

  def full_board?
    @board.horizontals.each do |col|
      return false if col.any? {|row| row == []}
    end
    true
  end

  def check_win(arrays)
    arrays.each do |array|
      counter_r = 0
      counter_b = 0
      array.each do |space|
        if space.empty?
          counter_r, counter_b = 0, 0
        elsif space.color == "R"
          counter_r += 1
        elsif space.color == "B"
          counter_b += 1
        end
      end
      return true if (counter_r == 4 || counter_b == 4)
    end
    false
  end
end

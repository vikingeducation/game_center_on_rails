class Player
  attr_reader :name
  def initialize(name, color, board)
    @name = name
    @color = color
    @board = board
  end

  def make_move(column)
    until check_move_valid?(column)
      @board.update_board(column, @color)
    end
  end

private
  def check_move_valid?(column)
    column.between?(0,6)
  end
end

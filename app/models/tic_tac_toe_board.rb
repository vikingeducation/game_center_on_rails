class TicTacToeBoard
  attr_reader :grid

  # initialize board
  def initialize(saved_grid = nil)
      # set up blank data structure if none given
      @grid = saved_grid || TicTacToeBoard.blank_board
  end

  def self.blank_board
    Array.new(3){Array.new(3)}
  end

  # add the player's piece to the board
  def add_piece(coords, piece)
    @grid[coords[0]][coords[1]] = piece
  end



  def winning_combination?(piece)
    winning_diagonal?(piece)   ||
    winning_horizontal?(piece) ||
    winning_vertical?(piece)
  end

  def winning_diagonal?(piece)
    diagonals.any? do |diag|
      diag.all?{|cell| cell == piece }
    end
  end

  def winning_vertical?(piece)
    verticals.any? do |vert|
      vert.all?{|cell| cell == piece }
    end
  end

  def winning_horizontal?(piece)
    horizontals.any? do |horz|
      horz.all?{|cell| cell == piece }
    end
  end

  def diagonals
    [[ @grid[0][0],@grid[1][1],@grid[2][2] ],[ @grid[2][0],@grid[1][1],@grid[0][2] ]]
  end

  def verticals
    @grid
  end

  def horizontals
    horizontals = []
    3.times do |i|
        horizontals << [@grid[0][i],@grid[1][i],@grid[2][i]]
    end
    horizontals
  end

  def full?
    @grid.all? do |row|
      row.none?(&:nil?)
    end
  end
end
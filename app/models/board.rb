class Board
  attr_reader :grid

  def initialize(grid = nil)
    @grid = grid || Array.new(7){Array.new(6){[]}}
  end

  def update_board(column, color)
    @grid[column][bottom(column)] = {color: color}
  end

  def bottom(column)
    @grid[column].index([])
  end

  def horizontals
    @grid.transpose
  end

  def verticals
    @grid
  end

  def rising_diagonals
    rising_diagonals = []
    (0..2).each do |start|
      col = 0
      diagonals = []
      (start..5).each do |row|
        diagonals << @grid[col][row]
        col += 1
      end
      rising_diagonals << diagonals
    end
    (1..3).each do |start|
      row = 0
      diagonals = []
      (start..6).each do |col|
        diagonals << @grid[col][row]
        row += 1
      end
      rising_diagonals << diagonals
    end
    rising_diagonals
  end


  def falling_diagonals
    falling_diagonals = []
    (3..5).each do |start|
      col = 0
      diagonals = []
      start.downto(0) do |row|
        diagonals << @grid[col][row]
        col += 1
      end
      falling_diagonals << diagonals
    end
    (1..3).each do |start|
      row = 5
      diagonals = []
      (start..6).each do |col|
        diagonals << @grid[col][row]
        row -= 1
      end
      falling_diagonals << diagonals
    end
    falling_diagonals
  end
end

class Board
  attr_reader :grid

  def initialize(grid = Array.new(7) { Array.new(6) { nil } } )
    @grid = grid
  end

end
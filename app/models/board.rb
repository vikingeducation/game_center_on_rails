class Board
  attr_reader :grid

  def initialize(grid = Array.new(7) { Array.new(6) { nil } } )
    @grid = grid
  end


  def render
    board = ""
    5.downto(0) do |row_idx|
      row = []
      grid.each do |col|
        cell = col[row_idx]
        if cell.nil?
          row << ' __ '
        else
          row << " #{cell} "
        end
      end
      board << " #{row} \n"
    end
    board 
  end

  def drop_piece(column, symbol)
    grid[column].each_with_index do |cell, index|
      if cell.nil? 
        @grid[column][index] = symbol
        break
      end
    end 
  end

  def column_full?(col)
    @grid[col].all? { |cell| !cell.nil? }
  end

  def victory?
    vertical_win?(@grid) || horizontal_win? || diaganol_win?
  end

  def draw?
    (0..6).all? { |col_idx| column_full?(col_idx) }
  end

  def game_over?
    victory? || draw?
  end

  private

  def vertical_win?(grid)
    grid.any? do |column|
      column.chunk { |cell| cell }.map { |a, b| b }.any? do |chunk|
        chunk.count >= 4
      end
    end
  end

  def horizontal_win?
    transposed = grid.transpose

    vertical_win?(transposed)
  end

  def diaganol_win?
    diaganols = []
    diaganols << [grid[0][2], grid[1][3], grid[2][4], grid[3][5]]
    diaganols << [grid[0][1], grid[1][2], grid[2][3], grid[3][4], grid[4][5]]
    diaganols << [grid[0][0], grid[1][1], grid[2][2], grid[3][3], grid[4][4], grid[5][5]]
    diaganols << [grid[1][0], grid[2][1], grid[3][2], grid[4][3], grid[5][4], grid[6][5]]
    diaganols << [grid[2][0], grid[3][1], grid[4][2], grid[5][3], grid[6][4]]
    diaganols << [grid[3][0], grid[4][1], grid[5][2], grid[6][3]]
    diaganols << [grid[6][2], grid[5][3], grid[4][4], grid[3][5]]
    diaganols << [grid[6][1], grid[5][2], grid[4][3], grid[3][4], grid[2][5]]
    diaganols << [grid[6][0], grid[5][1], grid[4][2], grid[3][3], grid[2][4], grid[1][5]]
    diaganols << [grid[5][0], grid[4][1], grid[3][2], grid[2][3], grid[1][4], grid[0][5]]
    diaganols << [grid[4][0], grid[3][1], grid[2][2], grid[1][3], grid[0][4]]
    diaganols << [grid[3][0], grid[2][1], grid[1][2], grid[0][3]]

    vertical_win?(diaganols)
  end

end
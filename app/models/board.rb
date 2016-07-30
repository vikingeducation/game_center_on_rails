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
          row << '_'
        else
          row << cell
        end
      end
      board << "#{row}\n"
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

  end

end
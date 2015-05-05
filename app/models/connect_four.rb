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
    while column_full?(column)
      column = rand(0..5)
    end
    make_move(column, ' Y ')
  end

  def make_move(column, color)
    row = 6
    until @board[row][column] == nil
      row -= 1
    end
    @board[row][column] = color
  end

  def is_full?
    if @board.flatten.all?
      true
    end
  end

  def column_full?( column )
    if @board[0][column] != nil
      true
    end
  end

  def player_won?
    vertical? || horizontal? || up_diagonal? || down_diagonal?
  end

  def vertical?
    @board.each do |row|
      0.upto(2) do |col|
        test_win = [ row[col], row[col+1], row[col+2], row[col+3] ]
        return true if winning_combo?( test_win )
      end
    end
    false
  end

  def horizontal?
    col = 0
    while col < 7 do
      0.upto(3) do |row|
        test_win = [ @board[row][col], @board[row+1][col], @board[row+2][col], @board[row+3][col] ]
        return true if winning_combo?( test_win )
      end
      col += 1
    end
    false
  end

  def up_diagonal?
    row = 0
    while row < 4 do
      0.upto(2) do |col|
        test_win = [ @board[row][col], @board[row+1][col+1], @board[row+2][col+2], @board[row+3][col+3] ]
        return true if winning_combo?( test_win )
      end
      row += 1
    end
    false
  end

  def down_diagonal?
    row = 0
    while row < 4 do
      5.downto(3) do |col|
        test_win = [ @board[row][col], @board[row+1][col-1], @board[row+2][col-2], @board[row+3][col-3] ]
        return true if winning_combo?( test_win )
      end
      row += 1
    end
    false
  end

  def winning_combo?( test_win )
    test_win.all? && test_win.uniq.length == 1
  end
end

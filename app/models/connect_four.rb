class ConnectFour

  attr_reader :board

  def initialize(board = nil)
    if board.nil?
      @board = Array.new(7) { Array.new }
    else
      @board = board
    end
  end

  def player_move(column)
    drop_piece(column, 'player')
  end

  def random_computer_move
    drop_piece(open_columns.sample, 'computer')
  end

  def drop_piece(column, coin)
    @board[column] << coin
  end

  def open_columns
    (0..6).each_with_object([]) do |col, open_cols|
      open_cols << col unless column_full? col
    end
  end

  def column_full?(column)
    board[column].length >= 6
  end

  def win?
    # Checks vertical, horizontal, and diaogonal victory conditions
    vertical_win? ||
    horizontal_win? ||
    up_diagonal_win? ||
    down_diagonal_win?
  end

  private

  def vertical_win?
    board.each do |col|
      0.upto(2) do |row|
        test_array = [ col[row],
                       col[row+1],
                       col[row+2],
                       col[row+3] ]
        return true if winning_array?(test_array)
      end
    end
    false
  end

  def horizontal_win?
    row = 0
    while row < 7 do
      0.upto(3) do |col|
        test_array = [ board[col][row],
                       board[col+1][row],
                       board[col+2][row],
                       board[col+3][row] ]
        return true if winning_array?(test_array)
      end
      row += 1
    end
    false
  end

  def up_diagonal_win?
    col = 0
    while col < 4 do
      0.upto(2) do |row|
        test_array = [ board[col][row],
                       board[col+1][row+1],
                       board[col+2][row+2],
                       board[col+3][row+3] ]
        return true if winning_array?(test_array)
      end
      col += 1
    end
    false
  end

  def down_diagonal_win?
    col = 0
    while col < 4 do
      5.downto(3) do |row|
        test_array = [ board[col][row],
                       board[col+1][row-1],
                       board[col+2][row-2],
                       board[col+3][row-3] ]
        return true if winning_array?(test_array)
      end
      col += 1
    end
    false
  end

  def winning_array?(array)
    # If there are any nils, that indicates an empty "spot"
    # A winning row will consist of the same values, and
    # therefore uniq.length will return 1
    !array.include?(nil) && array.uniq.length == 1
  end
end

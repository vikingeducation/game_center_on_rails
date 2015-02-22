class ConnectFour
  attr_reader :player_id
  attr_accessor :game_board, :board, :message

  def initialize (move, board=nil)
    @message = ""
    @board = board
    player_move = move.to_i - 1
    insert_coin(player_move, "X") #human move
    @message = set_message
  end

  def ai_move

  end

  def ai_wins?

  end

  def set_message
    if win?
      "Congrats! You win!"
    elsif full?
      "Board is full. You draw!"
    else
      "Make a move!"
    end
  end

  def insert_coin(column, player_id)
    if column_is_full?(column)
      # "Error: The column is full! Please choose another column"
      false
    else
      @board[column] << player_id
      true
    end
  end

  def win?
    # Checks vertical, horizontal, and diaogonal victory conditions
    vertical_win? ||
    horizontal_win? ||
    up_diagonal_win? ||
    down_diagonal_win?
  end

  def full?
    @board.each do |column|
      return false if column.length < 6
    end
    return true
  end


  def column_is_full?(column)
    @board[column].length == 6
  end

  def column_is_invalid?(column)
    !(0..6).include? column
  end

  def vertical_win?
    @board.each do |col|
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
        test_array = [ @board[col][row],
                       @board[col+1][row],
                       @board[col+2][row],
                       @board[col+3][row] ]
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
        test_array = [ @board[col][row],
                       @board[col+1][row+1],
                       @board[col+2][row+2],
                       @board[col+3][row+3] ]
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
        test_array = [ @board[col][row],
                       @board[col+1][row-1],
                       @board[col+2][row-2],
                       @board[col+3][row-3] ]
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

  # Game logic

  def game_over?
    @board.full? || @board.win?
  end

  # AI

  def pick_column
    rational_choice = pick_rationally
    if rational_choice
      rational_choice
    else
      pick_randomly
    end
  end

  def pick_rationally
    (0..6).each do |column|
      board_copy = Board.new
      board_copy.board = game_board.board.map { |column| column.dup }
      board_copy.insert_coin(column, player_id)
      if board_copy.win?
        return column + 1
      end
    end
    return false
  end

  def pick_randomly
    (1..7).to_a.sample
  end


end
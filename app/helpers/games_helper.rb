module GamesHelper
  # def get_or_create_board
  #   board = session["state"] if session["state"]
  #   board ||= new_board
  #   return board
  # end

  def new_board
    return [[],[],[],[],[],[],[]]
  end

  def play_move(move, board)
    return false if board[move].length >= 6
    turn = board.flatten.length % 2
    board[move] << turn
    session["board"] = board
    return true
  end

  def winner
    horizontal_winner || vertical_winner ||
    backslash_winner || forwardslash_winner
  end

  def horizontal_winner
    0.upto(5) do |row|
      0.upto(2) do |col|
        if (@state[0 + col][row] == @state[1 + col][row]) &&
        (@state[0 + col][row] == @state[2 + col][row]) &&
        (@state[0 + col][row] == @state[3 + col][row])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end
    return nil
  end

  def vertical_winner
    0.upto(5) do |col|
      0.upto(2) do |row|
        if (@state[col][0 + row] == @state[col][1 + row]) &&
          (@state[col][0 + row] == @state[col][2 + row]) &&
          (@state[col][0 + row] == @state[col][3 + row])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end
    return nil
  end

  def backslash_winner
    5.downto(3) do |row|
      0.upto(2) do |col|
        if (@state[col][row] == @state[col + 1][row - 1]) &&
          (@state[col][row] == @state[col + 2][row - 2]) &&
          (@state[col][row] == @state[col + 3][row - 3])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end

    return nil
  end

  def forwardslash_winner
    0.upto(2) do |row|
      0.upto(2) do |col|
        if (@state[col][row] == @state[1 + col][1 + row]) &&
          (@state[col][row] == @state[2 + col][2 + row]) &&
          (@state[col][row] == @state[3 + col][3 + row])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end
    return nil
  end

end

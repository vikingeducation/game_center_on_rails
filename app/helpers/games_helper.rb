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

  def check_winner(board)
    horizontal_winner(board) || vertical_winner(board) ||
    backslash_winner(board) || forwardslash_winner(board)
  end

  def horizontal_winner(board)
    0.upto(5) do |row|
      0.upto(3) do |col|
        if (board[0 + col][row] == board[1 + col][row]) &&
        (board[0 + col][row] == board[2 + col][row]) &&
        (board[0 + col][row] == board[3 + col][row])
          return board[col][row] unless board[col][row].nil?
        end
      end
    end
    return nil
  end

  def vertical_winner(board)
    0.upto(6) do |col|
      0.upto(2) do |row|
        if (board[col][0 + row] == board[col][1 + row]) &&
          (board[col][0 + row] == board[col][2 + row]) &&
          (board[col][0 + row] == board[col][3 + row])
          return board[col][row] unless board[col][row].nil?
        end
      end
    end
    return nil
  end

  def backslash_winner(board)
    6.downto(3) do |row|
      0.upto(2) do |col|
        if (board[col][row] == board[col + 1][row - 1]) &&
          (board[col][row] == board[col + 2][row - 2]) &&
          (board[col][row] == board[col + 3][row - 3])
          return board[col][row] unless board[col][row].nil?
        end
      end
    end

    return nil
  end

  def forwardslash_winner(board)
    0.upto(3) do |row|
      0.upto(2) do |col|
        if (board[col][row] == board[1 + col][1 + row]) &&
          (board[col][row] == board[2 + col][2 + row]) &&
          (board[col][row] == board[3 + col][3 + row])
          return board[col][row] unless board[col][row].nil?
        end
      end
    end
    return nil
  end

end

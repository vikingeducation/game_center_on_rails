module GamesHelper
  def get_or_create_board
    board = session["state"] if session["state"]
    board ||= new_board
    return board
  end

  def new_board
    return [[],[],[],[],[],[],[]]
  end

  def play_move(move, board)
    return false if board[move].length >= 6
    turn = board.flatten.length % 2
    board[move] << turn
  end
end

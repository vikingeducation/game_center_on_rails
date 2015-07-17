module GamesHelper
  # def get_or_create_board
  #   board = session["state"] if session["state"]
  #   board ||= new_board
  #   return board
  # end

  def new_board
    return [[],[],[],[],[],[],[]]
  end

  def legal?(move, board)
    board[move].length < 6
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

class AI

  def initialize(board, player_num=1)
    @board = board
    @player_num = player_num
  end

  # The AI searches for a winning move, then a "not-losing" move, then a random move.
  # Only searches one move deep.
  def move
    potential_move ||= winning_move
    potential_move ||= living_move
    potential_move ||= random_move
  end

  private

    # Returns a new board object with the same state as the real board.
    # This is important so we do not accidentally tamper with our
    # real board's state.
    def board_copy
      return @board.dup
    end

    # Simulates and sees if there is a move that wins for the AI.
    def winning_move
      simulate_move(@player_num)
    end

    # Simulates and sees if there is a move that wins for the player.
    # The reason for this is if there is a move that wins for the player,
    # the AI can play it during it's own turn to avoid losing.
    def living_move
      simulate_move(opponent)
    end

    # Simulates all next moves of the selected player and returns if any
    # of those moves wins the game for said player.
    def simulate_move(player)
      moves = (0..5).to_a
      moves.each do |col|
        sim_board = board_copy
        unless sim_board.col_full?(col)
          sim_board.move([col,player])
          if sim_board.winner == player
            return col
          end
        end
      end
      return nil
    end

    # Method returns opposite player
    def opponent
      (@player_num - 1).abs
    end

    # Returns a random move in the case that there is no
    # good candidate for a not-losing or winning move.
    # Avoids full columns.
    def random_move
      moves = (0..5).to_a
      sim_board = board_copy
      moves.reject!{|col| sim_board.col_full?(col)}
      moves.sample
    end

  end
end

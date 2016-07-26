module ConnectFourHelper

  def execute_player_move(move)
    board = session[:board]
    board = add_piece(board, move)
    session[:board] = board
  end


  def add_piece(board, move, piece="R")
    spot = board[move].rindex(nil)
    board[move][spot] = piece
    board
  end

  def execute_computer_move
    board = session[:board]
    available_columns = (0..6).to_a - get_full_columns
    session[:board] = add_piece(board, available_columns.sample, "B")
  end

  def get_full_columns
    board = session[:board]
    full = []
    board.each_with_index do |column, i|
      if column.first != nil
        full << i
      end
    end
    full
  end

  def check_winner?(piece)
    board = session[:board]
    check_columns?(piece, board) || 
    check_rows?(piece, board) ||
    check_up_diagonals?(piece, board) ||
    check_down_diagonals?(piece, board)
  end

  def check_columns?(piece, board)
    board.each do |column|
      3.times do |index|
        if column[index..(index + 3)].all? { |element| element == piece }
          if check_array_for_match(column[index..(index + 3)], piece)
            return true
          end
        end
      end
    end
    false
  end

  def check_rows?(piece, board)
    6.times do |row|
      4.times do |column|
        row_array = []
        4.times do |index|
          row_array << board[column + index][row]
        end
        if check_array_for_match(row_array, piece)
          return true
        end
      end
    end
    false
  end

 def check_up_diagonals?(piece, board)
    3.times do |row|
      4.times do |column|
        diagonal_array = []
        4.times do |index|
          diagonal_array << board[column + index][row + index]
        end
        if check_array_for_match(diagonal_array, piece)
          return true
        end
      end
    end
    false
  end

  def check_down_diagonals?(piece, board)
    row_index = 3
    while row_index <= 5
      4.times do |column|
      diagonal_array = []
        4.times do |index|
          diagonal_array << board[column + index][row_index - index]
        end
        if check_array_for_match(diagonal_array, piece)
          return true
        end
      end
      row_index += 1
    end
    false
  end

  def check_array_for_match(array, piece)
    array.all? { |element| element == piece}
  end

  def tie?
    board.each do |column|
      if column.any? { |piece| piece == nil }
        return false
      end
    end
    session["winner"] = "tie"
  end

  private

  def whitelisted_params
    params.permit(:move)
  end


end

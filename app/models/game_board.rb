class GameBoard

  attr_reader :board

  def initialize(board = nil)
    @board = Array.new(6, Array.new(7))
    @player_piece = "X"
    @computer_piece = "O"
  end

  def run(column)
    place(@player_piece, column)
    return @player_piece if detected_win?(@player_piece)
    computer_move
    return @computer_piece if detected_win?(@computer_piece)
    return "draw" if board_full?
  end

  def computer_move
    column = (0..6).to_a.sample
    place(@computer_piece, column)
  end

  def place(piece_type, column_index)
    piece_added = false
    (@board.length-1).downto(0) do |row_index|
      break if piece_added == true
      if @board[row_index][column_index] == ''
        @board[row_index][column_index] = piece_type
        piece_added = true
      end
    end
  end

  def four_in_a_row?(array, piece_type)
    string = array.join('')
    pattern = piece_type * 4
    string.include?(pattern)
  end

  def detected_win?(piece_type)
    vertical_win?(piece_type) || horizontal_win?(piece_type)
  end

  def vertical_win?(piece_type)
    @board.transpose.any? { |column| four_in_a_row?(column, piece_type) }
  end

  def horizontal_win?(piece_type)
    @board.any? { |row| four_in_a_row?(row, piece_type) }
  end

  def board_full?
    @board.all? do |row|
      row.none? do |cell|
        cell == ' '
      end
    end
  end

#   def column(column_index)
#     columns = @grid.transpose
#     columns[column_index]
#   end

#   def column_full?(column_index)
#     ['X','O'].include?(column(column_index)[0])
#   end



#   def diagonal_win?(piece_type)
#     generate_diagonals(@grid).any? { |diag| four_in_a_row?(diag, piece_type)} || generate_diagonals(@grid.transpose).any? { |diag| four_in_a_row?(diag, piece_type)}
#   end

#   def generate_diagonals(rect_array)
#     results = []
#     begin
#       (0..rect_array.length).each do |i|
#         diag = []
#         (0..i).each do |j|
#           (0..i).each do |k|
#             diag.push(rect_array[j][k]) if j + k == i
#           end
#         end
#         results.push(diag)
#       end
#     rescue
#     end
#     results
#   end


end
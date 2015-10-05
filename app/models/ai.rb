class Ai
  def initialize(board_arr)
    @board_arr = board_arr
  end
  

  def make_move
    winning_move = block_or_win("blue")
    blocking_move = block_or_win("red")
    
    winning_move || blocking_move || random_move
  end


  private


  def block_or_win(piece)
    0.upto(6) do |col_number|
      test_board = Board.new(Marshal::load(Marshal.dump(@board_arr)))
      if test_board.add_piece(col_number, piece)
        if test_board.winning_line?(piece)
          return col_number
        else
          next
        end
      end
    end
    return false
  end


  def random_move
    (0..6).to_a.shuffle.each do |col_number|
      test_board = Board.new(Marshal::load(Marshal.dump(@board_arr)))
      return col_number if test_board.valid_move?(col_number)
    end
  end
  
end
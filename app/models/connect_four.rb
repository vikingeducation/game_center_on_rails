class ConnectFour
  attr_reader :active_board

  def initialize(new_board = nil)
    if new_board.nil?
      @active_board = build_board
    else
      @active_board = new_board
    end
  end

  def add_piece(column, player_color)
    row = find_available_row(column)
    @active_board[row][column] = player_color
  end

  def find_available_row(column)
    (0..5).each do |i|
      if @active_board[i][column].nil?
        return i
      end
    end
  end

  def build_board
    Array.new(6) { Array.new(7, nil) }
  end

  def col_full?(column)
    @active_board.transpose[column].none?{|row|row.nil?}
  end

  def board_full?
    @active_board.flatten.none?{|square| square.nil?}
  end
end

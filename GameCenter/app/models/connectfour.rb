class Connectfour
  attr_accessor :board
  def initialize(board=nil)
    if board.nil?
      @board = Board.new
    else
      @board = Board.new(board)
    end
  end



  def check_move(column)
    if valid_move?(column)
      add_piece(column)
    end
    @board
  end

  def valid_move?(column)
   true
   #(0..6).include?(column)# && @board[column].length < 6
  end

  def add_piece(column)
    @board.board[column.to_i] << 'X'
  end

end



class Connectfour
  attr_accessor :board
  def initialize(board=nil)
    if board.nil?
      @board = Board.new
    else
      @board = Board.new(board)
    end
  end



  def check_move(column,player)
    if valid_move?(column)
      return true

    else
      return false
    end
  end

  def valid_move?(column)
    column = column.to_i
   (0..6).include?(column) && @board.board[column].length < 6
  end

  def add_piece(column,player)
    if player == 'X'
      @board.board[column.to_i] << 'X'
    else
      @board.board[column.to_i] << 'Y'
    end
    @board.board
  end




  ################ game checks
  def check_victory(last_move)
    vertical_check(last_move) || horizontal_check(last_move) || diagonal_up_check(last_move) || diagonal_down_check(last_move)
  end

  def vertical_check(last_move)
    last_move = last_move.to_i
    result=true
    0.upto(3) do |i|
     result = false unless (@board.board[last_move][-1-i]  == @board.board[last_move][-1])
    end
    result
  end

  def horizontal_check(last_move)
    last_move = last_move.to_i
    result = true
    color = @board.board[last_move][-1]
    row = @board.board[last_move].length-1
    same_count = 0
    (0..6).each do |i|
      if @board.board[i][row] == color
        same_count += 1
        return true if same_count == 4
      else
        same_count=0
      end
    end
    false
  end


  def diagonal_up_check(last_move)
    last_move = last_move.to_i
    (0..6).each do |column|
      (0..5).each do |row|
        color = @board.board[column][row]
        break unless @board.board[column+3] && @board.board[column+3][row+3]
        return true if @board.board[column+1][row+1] == color && @board.board[column+2][row+2] == color && @board.board[column+3][row+3] == color
      end
    end
    false
  end

  def diagonal_down_check(last_move)
    last_move = last_move.to_i
    (0..6).each do |column|
      (0..5).each do |row|
        color = @board.board[column][row]
        break unless @board.board[column-3] && @board.board[column-3][row+3]
        return true if @board.board[column-1][row+1] == color && @board.board[column-2][row+2] == color && @board.board[column-3][row+3] == color
      end
    end
    false
  end

end



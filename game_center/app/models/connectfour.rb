class Connectfour
  attr_accessor :board

  def initialize(c4array=nil)
    if c4array
      @board = c4array
    else
      @board = Array.new(7){Array.new}
    end
  end

  def board
    @board
  end

  def make_move(move, player)
    intmove = move.to_i
    place_piece(intmove, player) if is_valid?(intmove)
  end

  def check_win
    horizontal || vertical || search_diagonal || search_other_diagonal || check_draw
  end

  def place_piece(move, player)
    @board[move-1] << player
  end

  def is_valid?(move)
    intmove = move.to_i
    (0..6).include?(intmove-1) && @board[intmove-1].length < 7
  end

# Checks

  def check_victory(last_move)
    last_move = last_move.to_i - 1
    vertical_check(last_move) || horizontal_check(last_move) || diagonal_up_check(last_move) || diagonal_down_check(last_move)
  end

  def vertical_check(last_move)
    last_move = last_move.to_i
    result=true
    0.upto(3) do |i|
     result = false unless (@board[last_move][-1-i]  == @board[last_move][-1])
    end
    result
  end

  def horizontal_check(last_move)
    last_move = last_move.to_i
    result = true
    color = @board[last_move][-1]
    row = @board[last_move].length-1
    same_count = 0
    (0..6).each do |i|
      if @board[i][row] == color
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
        color = @board[column][row]
        break unless @board[column+3] && @board[column+3][row+3]
        return true if @board[column+1][row+1] == color && @board[column+2][row+2] == color && @board[column+3][row+3] == color
      end
    end
    false
  end

  def diagonal_down_check(last_move)
    last_move = last_move.to_i
    (0..6).each do |column|
      (0..5).each do |row|
        color = @board[column][row]
        break unless @board[column-3] && @board[column-3][row+3]
        return true if @board[column-1][row+1] == color && @board[column-2][row+2] == color && @board[column-3][row+3] == color
      end
    end
    false
  end

end
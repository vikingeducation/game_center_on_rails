class Connectfour
  attr_accessor :board

  def initialize(c4array=nil)
    @board = c4array || Array.new(7){Array.new}
  end

  def make_move(move, player)
    @board[move.to_i] << player
  end

# Checks

  def check_victory
    check_vertical || check_horizontal || check_diagonal_up || check_diagonal_down
  end

  def check_vertical
    (0..6).each do |col|
      (0..2).each do |row|
        return true if @board[col][row] && (1..3).all? { |y| @board[col][row] == @board[col][row+y] }
      end
    end
    false
  end

  def check_horizontal
    (0..3).each do |col|
      (0..5).each do |row|
        return true if @board[col][row] && (1..3).all? { |x| @board[col][row] == @board[col+x][row]}
      end
    end
    false
  end

  def check_diagonal_up
    (0..3).each do |col|
      (0..2).each do |row|
        return true if @board[col][row] && (1..3).all? { |diag| @board[col][row] == @board[col+diag][row+diag]}
      end
    end
    false
  end

  def check_diagonal_down
    (0..3).each do |col|
      (3..5).each do |row|
        return true if @board[col][row] && (1..3).all? { |diag| @board[col][row] == @board[col+diag][row-diag]}
      end
    end
    false
  end

end
class Connectfour
  attr_accessor :board

  def initialize(c4array=nil, win_count=4, height=6, width=7)
    @win_count, @height, @width = win_count, height, width
    @board = c4array || Array.new(@width){Array.new}
  end

  def ceiling(step, dimension)
    step > 0 ? dimension - @win_count : dimension - 1
  end

  def floor(step)
    step < 0 ? @win_count - 1 : 0
  end

  def make_move(move, player)
    @board[move.to_i] << player
  end

  def check_victory
    check(0,1) || check(1,0) || check(1,1) || check(1,-1)
  end

  def check(h_step, v_step)
    (floor(h_step)..ceiling(h_step, @width)).each do |col|
      (floor(v_step)..ceiling(v_step, @height)).each do |row|
        return true if @board[col][row] && (1..(@win_count-1)).all? do |x|
          @board[col][row] == @board[col+x*h_step][row+x*v_step]
        end
      end
    end
    false
  end

end
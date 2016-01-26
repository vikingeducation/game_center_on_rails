

class ConnectFourGame

  attr_reader :board

  def initialize(game_state = nil)
    @board = game_state || Array.new(6){Array.new(7)}
  end

  def drop_piece(col)
    (board.size-1).downto(0) do |row|
      if @board[row][col] == nil
        @board[row][col] = current_player
        break
      end
    end
  end

  def current_player
    num_zeros = @board.flatten.count{|i| i == 0}
    num_ones = @board.flatten.count{|i| i == 1}

    if num_ones < num_zeros
      return 1
    else 
      return 0
    end

  end

end

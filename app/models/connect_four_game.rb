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

  def valid_move?(col)
    @board.transpose[col].any?(&:nil?)
  end

  def moves
    (1..@board[0].size).to_a
  end

  def current_player
    num_zeros = @board.flatten.count{|i| i == 0}
    num_ones = @board.flatten.count{|i| i == 1}

    num_ones < num_zeros ? 1 : 0
  end
end

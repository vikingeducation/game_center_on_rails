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

  def winner_horizontal? 
    @board.any? do |row|
      row.each_cons(4).to_a.any? do |array|
        array.all? {|cell| cell == 0} || 
        array.all? {|cell| cell == 1}
      end
    end
  end

  def winner_vertical? 
    @board.transpose.any? do |col|
      col.each_cons(4).to_a.any? do |array|
        array.all? {|cell| cell == 0} || 
        array.all? {|cell| cell == 1}
      end
    end
  end

  def winner?
    winner_vertical? || winner_horizontal?
  end

  def diagonal_coords(size)
  left_array = push_array(size, :left)
  right_array = push_array(size, :right)
  [left_array, right_array].flatten(1)
end

# def push_array(size, direction)
#   array = Array.new(size) { |x| Array.new(size) { |y| [x,y] }}
#   size.times do |i|
#     case direction
#     when :right then right = size - 1 - left = i
#     when :left then left = size - 1 - right = i
#     end
#     right.times do
#       array[i].unshift(nil)
#     end
#     left.times do
#       array[i] << nil
#     end
#   end
#   array.transpose.map(&:compact)
# end

#   def winner_diagonal?
#     @board.transpose.any? do |col|
#       col.each_cons(4).to_a.any? do |array|
#         array.all? {|cell| cell == 0} || 
#         array.all? {|cell| cell == 1}
#       end
#     end

  end

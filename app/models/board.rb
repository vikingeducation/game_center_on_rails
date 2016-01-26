class Board

  attr_accessor :board

  def initialize(board=nil)
    @board = board ? board : Array.new(6) { Array.new(7, 0) }
  end

  def valid_move?(player_input)
    @board[6 - 1][player_input.to_i - 1] == 0 ? true : false
  end

  #add disk object to appropraite column
  def place_disk ( player_boolean, column )
    (0...6).each do |row|
      if @board[row][column.to_i - 1] == 0
        @board[row][column.to_i - 1] = player_boolean ? 1 : 2
        break
      end
    end
  end
end

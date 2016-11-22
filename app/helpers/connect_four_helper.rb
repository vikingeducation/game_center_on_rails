module ConnectFourHelper
  class Board
    attr_accessor :board_array
    def initialize(board = gen_board)
      @board_array  = board
    end

    def gen_board
      Array.new(6) { |i| i = Array.new(7){|x| x = "_"}}
    end
  end
end

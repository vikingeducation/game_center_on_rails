module ConnectFourHelper

  class Board

    attr_accessor :board_array

    def initialize(board = gen_board)
      @board_array  = board
    end

    def gen_board
      Array.new(6) { |i| i = Array.new(7){|x| x = "_"} }
    end

    # _______
    # _______
    # _______
    # _______
    # _______
    # _______

    def add_piece(column, piece)
      current_board = board_array.reverse
      current_board.each do |row|
        if row[column] = '_'
          row[column] = piece
          break
        end
      end
    end

  end

end

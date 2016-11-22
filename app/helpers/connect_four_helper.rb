module ConnectFourHelper

  class Board

    attr_accessor :board_array

    def initialize(board = gen_board)
      @board_array  = board
    end

    def gen_board
      @board_array = Array.new(7){ Array.new }
    end

    def add_padding
      @board_array.map! do |col|
        while col.length < 6
          col << nil
        end
        col
      end
    end

    def remove_padding
      @board_array.map! do |col|
        col.compact!
      end
    end

    # _______
    # _______
    # _______
    # _______
    # _______
    # _______

    def add_piece(column, piece)
      @board_array[column] << piece

    end

  end

end

module ConnectFourHelper

  class Board

    attr_accessor :board_array

    def initialize(board = gen_board)
      @board_array  = board
    end

    def gen_board
      @board_array = Array.new(7){ Array.new }
    end

    # def add_padding
    #   @board_array.map! do |col|
    #     while col.length < 6
    #       col << nil
    #     end
    #     col
    #   end
    # end

    # def remove_padding
    #   @board_array.map! do |col|
    #     col.compact!
    #   end
    # end

    def win?
      vertical_win? || horizontal_win? ||
      diagonal_win_neg? || diagonal_win_pos?
    end

    def valid_move
      return nil if full_board?
      move = rand(6)
      if full_column?(move)
        return valid_move
      end
      move
    end

    def add_piece(column, piece)
      return unless !!column
      @board_array[column] << piece
    end

    def full_column?(column)
      @board_array[column].length == 6
    end

    def full_board?
      @board_array.all? { |col| col.length == 6 }
    end

    def vertical_win?
      @board_array.each do |column|
        next if column.length < 4
        chunks = column.each_cons(4)
        return true if has_winning_chunk?(chunks)
      end
      false
    end

    def horizontal_win?
      (0..6).each do |row_num|
        row_pieces = []
        @board_array.each do |column|
          row_pieces << column[row_num] if column[row_num] # ...exists
        end
        next if row_pieces.length < 4
        chunks = row_pieces.each_cons(4)
        return true if has_winning_chunk?(chunks)
      end
      false
    end

    def diagonal_win_neg? # top left to bottom right diagonal
      return false if not_enough_pieces?
      board_padded = pad_board(nil) # fill all empty spaces in board with nil
      (0..3).each do |col_num|
        (0..2).each do |row_num|
          diagonal_pieces = []
          (0..3).each do |offset|
            diagonal_pieces << board_padded[col_num+offset][row_num+offset]
          end
          next if diagonal_pieces.include?(nil)
          return true if pieces_identical?(diagonal_pieces)
        end
      end
      false
    end

    def diagonal_win_pos? # top right to bottom left diagonal
      flip_board
      result = diagonal_win_neg?
      flip_board
      result
    end

    # helpers

    def pieces_identical?(piece_array)
      first_piece = piece_array[0]
      piece_array.all? { |piece| piece == first_piece }
    end

    def has_winning_chunk?(chunks)
      chunks.each do |four_piece_chunk|
        return true if pieces_identical?(four_piece_chunk)
      end
      false
    end

    def not_enough_pieces?
      @board_array.all? { |column| column.length < 4 }
    end

    def pad_board(pad_val)
      @board_array.map do |column|
        while column.length < 6
          column << pad_val
        end
        column
      end
    end

    def flip_board
      @board_array.map! { |column| column.reverse }
    end

  end

end

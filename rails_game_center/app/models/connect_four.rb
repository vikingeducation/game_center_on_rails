class ConnectFour #Plain Old Ruby Object

  def initialize(board, curr_player)
    @playfield = board
    @current_player = curr_player
  end

    def accept_piece(col_num, piece)
      @playfield[col_num - 1].each_with_index do |cell, index|
        next unless cell == "_"
        @playfield[col_num - 1][index] = piece
        break
      end
    end

    def diag_pieces_in_a_row?(piece_count, piece)
      # check if there are {piece_count}
      # number of pieces in a diagonal row
      diagonals.any? do |diag|
        if diag.size > 3
          diag.join('').include?((piece * piece_count))
        end
      end
    end

    # game's X rows
    def vert_pieces_in_a_row?(piece_count, piece)
        # check if there are {piece_count}
        # number of pieces in a vertical row
        verticals.any? do |vert|
            vert.join('').include?((piece * piece_count))
          end
    end

    # game's Y columns
    def horz_pieces_in_a_row?(piece_count, piece)
        # check if there are {piece_count}
        # number of pieces in a horizontal row
        horizontals.any? do |horz|
           horz.join('').include?((piece * piece_count))
        end
    end

    def diagonals
      [@playfield, @playfield.map(&:reverse)].inject([]) do |all_diags, matrix|
      ((-matrix.count + 1)..matrix.first.count).each do |offet_index|
        diagonal = []
        (matrix.count).times do |row_index|
          col_index = offet_index + row_index
          diagonal << matrix[row_index][col_index] if col_index >= 0
        end
        all_diags << diagonal.compact if diagonal.compact.count > 1
      end
      all_diags
    end
    end

    def verticals
        # return the vertical pieces
        @playfield
    end

    # horizontals
    def horizontals
        # return the horizontal pieces
        horizontals = []
        6.times do |i|
            horizontals << [@playfield[0][i],@playfield[1][i],@playfield[2][i],@playfield[3][i],@playfield[4][i],@playfield[5][i],@playfield[6][i]]
        end
        horizontals
    end

end


module ConnectFourHelper

  def add_piece(board, move, piece="R")
    spot = board[move].rindex(nil)
    board[move][spot] = piece
    board
  end

  def add_computer_piece(board)

    available_columns = (0..6).to_a - get_full_columns(board)
    add_piece(board, available_columns.sample, "B")
  end

  def get_full_columns(board)
    full = []
    board.each_with_index do |column, i|
      if column.first != nil
        full << i
      end
    end
    full
  end

  private

  def whitelisted_params
    params.permit(:move)
  end


end

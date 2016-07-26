module ConnectFourHelper
  
  def add_piece(board, move, piece="R")
    spot = board[move].rindex(nil)
    board[move][spot] = piece
    board
  end

  def add_computer_piece(board)
    get_full_columns(board)
    available_columns = (0..6).to_a - session[:full_columns]
    add_piece(board, available_columns.sample, "B")
  end

  def get_full_columns(board)
    full = []
    board.each_with_index do |column|
      full << index unless column.last == nil
    end
    session[:full_columns] = full
  end

  private

  def whitelisted_params
    params.permit(:move)
  end


end

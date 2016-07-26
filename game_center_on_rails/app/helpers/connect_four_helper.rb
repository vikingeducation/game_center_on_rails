module ConnectFourHelper
  def add_piece(board, move)
    board[move].map do |spot|
      if spot == nil
        spot = "R"
        break
      end
    end
  end

end

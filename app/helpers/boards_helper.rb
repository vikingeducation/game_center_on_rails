module BoardsHelper
  def render_board(board)
    board.grid.map do |row_number, row|
      "<h5>#{row_number} #{row}</h5>"
    end.join.html_safe
  end
end
 
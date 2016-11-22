
require File.expand_path('../board', __FILE__)

class ConnectFourGame #< ApplicationRecord

  def initialize(args = {})
    @board = Board.new(state: args[:board])
  end

  def board_rows
    board.rows
  end

  def board
    board.state
  end

  def make_move(column)
    column -= 1
    if valid_move?(column)
      board.drop_in_column(column)
      true
    else
      false
    end
  end

  private
    attr_reader :board

    def valid_move?(column)
      board.column(column)
    end

end

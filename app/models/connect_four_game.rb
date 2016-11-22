
require File.expand_path('../board', __FILE__)

class ConnectFourGame #< ApplicationRecord

  def initialize(args = {})
    @board = Board.new(state: args[:board])
  end

  def board_rows
    board.rows
  end

  private
    attr_reader :board
end

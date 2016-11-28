
require File.expand_path('../board', __FILE__)

class ConnectFourGame #< ApplicationRecord
  attr_reader :active_player

  def initialize(args = {})
    @board = Board.new(state: args[:board])
    @active_player = args[:ap] || 'red'
  end

  def board_rows
    @board.rows
  end

  def board
    @board.state
  end

  def make_move(column)
    column -= 1
    if @board.column_not_full?(column)
      @board.drop_in_column(active_player, column)
      switch_active_player
      true
    else
      false
    end
  end

  def winner
    four_in_a_row?
  end

  private

    def four_in_a_row?
      board.rows
    end

    def check_rows
      board.rows.each do |row|

      end
    end

    def check_columns

    end

    def check_diagonals
    end

    def check_consecutive(area)
    end

    def switch_active_player
      @active_player = active_player == 'red' ? 'blue' : 'red'
    end
end

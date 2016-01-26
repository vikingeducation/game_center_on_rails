require_relative 'player'
require_relative 'piece'

class Board

  attr_accessor :session, :grid, :player1, :player2, :current_player

  def initialize(session=nil)
    # 6 rows, 7 columns, numbering is 1 at top, 6 at bottom
    @session = session

    @grid =  @session[:grid] || {1 => Array.new(7), 2 => Array.new(7), 3 => Array.new(7), 4 => Array.new(7), 5 => Array.new(7), 6 => Array.new(7)}
    @player1 = Player.new('red')
    @player2 = Player.new('yellow')
    @current_player = @session[:current_player] || @player1
  end

  def place_piece(column)
    row = 6
    until @grid[row][column].nil?
      row -= 1
    end
    @grid[row][column] = Piece.new(current_player.color)
    switch_player
  end

  def column_full?(column)
    !!@grid[1][column]
  end

  def switch_player
    if current_player == @player1
      current_player = @player2
    else
      current_player = @player1
    end
  end
end

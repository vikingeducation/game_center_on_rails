class Board

  attr_accessor :board

  NUM_ROWS = 6
  NUM_COLS = 7
  FOUR = 4

  def initialize(board=nil)
    @board = board ? board : Array.new(6) { Array.new(7, 0) }
  end

  def valid_move?(player_input)
    @board[6 - 1][player_input.to_i - 1] == 0 ? true : false
  end

  #add disk object to appropraite column
  def place_disk ( player_boolean, column )
    (0...6).each do |row|
      if @board[row][column.to_i - 1] == 0
        @board[row][column.to_i - 1] = player_boolean ? 1 : 2
        break
      end
    end
  end

  #return true if connect 4 exists and game ends
  def win_conditions?
    check_rows || check_cols || check_diagonals
  end

  #check for connect 4 along rows
  def check_rows
    @board.each do |row|
      (0...NUM_COLS - FOUR + 1).each do |i|
        return check_connect_four?( row[i...i+FOUR] )
      end
    end
    false
  end

  #check every column for 4 vertical
  def check_cols
    (0...NUM_COLS).each do |col|
      (0...NUM_ROWS - FOUR + 1).each do |row|
        col_array = []
        (0...FOUR).each do |index|
          col_array << @board[row + index][col]
        end
        return true if check_connect_four?(col_array)
      end
    end
    false
  end

  #check diagonals for connect 4
  def check_diagonals
    #diagonals from top left to bottom right
    (0..NUM_ROWS - FOUR).each do | row |
      (0..NUM_COLS - FOUR).each do |  col |
        diag_array = []
        (0...FOUR).each do |  square |
          diag_array << @board[row + square][col + square]
        end
        return true if check_connect_four?(diag_array)
      end
    end
    #diagonals from top right to bottom left
   (0..NUM_ROWS - FOUR).each do | row |
      (NUM_COLS - 1).downto ( NUM_COLS - FOUR ) do |  col |
        diag_array = []
        (0...FOUR).each do |  square |
          diag_array << @board[row + square][col - square]
        end
        return true if check_connect_four?(diag_array)
      end
    end
    false
  end

  #checks array for connect 4
  def check_connect_four?(arr)
    #checks for full array
    return false if arr.any?(&:nil?)
    #if array is full then check for winner
    return true if arr.all? { |square| square == 1 }
    return true if arr.all? { |square| square == 2 }
    #otherwise return false
    false
  end

  #return true if grid is full, else return false on empty square
  def grid_full?
    @board.each do |row|
      row.each do |square|
        return false if square == nil
      end
    end
    true
  end

end

class Board

  # awkwardly named this to avoid the evils of calling Board#board
  attr_accessor :play_field

  # a board seven wide and 6 high
  # each column is a stack that can only be pushed onto
  # rejects move if stack is already 6
  def initialize(arr=nil)
    @play_field = arr || Array.new(7) { Array.new }
  end

  # the master victory condition Boolean.
  # has anyone gotten a connect_four on this board?
  # NOTE TO STUDENTS: all component victory booleans are private
  def has_victory?
    vertical_c4? || horizontal_c4? || diagonal_c4?
  end


  def is_draw?
    @play_field.all? {|i| i.length == 6}
  end

  def valid_move?(column, color)
    (0..6).include?(column) && @play_field[column].length < 6
  end

  def add_piece(column, color)
    @last_move = column
    @play_field[column] << color
  end

  # anything that can be private should be private
  private


  # this helper method knows that these two are implemented differently
  # so that the main victory condition doesn't have to
  def diagonal_c4?
    diagonal_up_c4? || diagonal_down_c4?
  end

  # Checks only vertical connect-fours
  # depends on last move being correctly tracked
  def vertical_c4?
    result=true

    this_column = @play_field[@last_move]

    return false if this_column.length < 4

    last_move_color = this_column[-1]



    #checks if the top 4 in the stack are all the same color
    this_column[-4..-1].all? {|move| move == last_move_color}


  end

  # checks for horizontal connect-four
  def horizontal_c4?
    result = true
    color = @play_field[@last_move][-1]
    row = @play_field[@last_move].length - 1
    same_count = 0

    #crawls horizontally along the board at height of last move
    #tries to chain up 4 in a row, starts count over if it meets a
    # blank or the other color
    (0..6).each do |i|
      if @play_field[i][row] == color
        same_count += 1
        return true if same_count == 4
      else
        same_count=0
      end
    end
    false
  end


  # traverses the whole board looking for diagonal-up connect fours
  def diagonal_up_c4?

    return false unless @play_field[@last_move]
    color = @play_field[@last_move][-1]

    (0..6).each do |column|
      (0..5).each do |row|
        #only checks four in a row if both start and endpoints exist
        break unless @play_field[column+3] && @play_field[column+3][row+3]
        return true if @play_field[column+1][row+1] == color && @play_field[column+2][row+2] == color && @play_field[column+3][row+3] == color
      end
    end
    false
  end

  #just like diagonal_up
  def diagonal_down_c4?
    return false unless @play_field[@last_move]
    color = @play_field[@last_move][-1]

    (0..6).each do |column|
      (0..5).each do |row|
        break unless @play_field[column-3] && @play_field[column-3][row+3]
        return true if @play_field[column-1][row+1] == color && @play_field[column-2][row+2] == color && @play_field[column-3][row+3] == color
      end
    end
    false
  end

end

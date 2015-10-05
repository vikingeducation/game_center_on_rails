class Board

  attr_reader :board_arr, :full_columns

  
  def initialize(board_arr = nil)
    @board_arr = board_arr || blank_board
    @full_columns = find_full_columns
  end


  def valid_move?(column)
    !@full_columns.include?(column)
  end


  def add_piece(column, piece)
    if valid_move?(column)
      top_blank = @board_arr[column].find_index(&:nil?)
      @full_columns << column if top_blank == 5
      @board_arr[column][top_blank] = piece
    else
      false
    end    
  end


  def winning_line?(piece)
    winning_horizontal?(piece) ||
      winning_diagonal?(piece) ||
      winning_vertical?(piece)
  end


  def full?
    @board_arr.flatten.all? { |piece| piece != nil }
  end


  # def full_board
  #   Array.new(7){Array.new(6, "xxx")}
  # end


  private


  def blank_board
    Array.new(7){Array.new(6)}
  end


  def find_full_columns
    full_columns = []

    @board_arr.each_with_index do |col, col_number|
      full_columns << col_number unless col.last == nil
    end

    full_columns
  end


  def diagonal_steps?(piece, starting_column, starting_position)
    if @board_arr[(starting_column + 1)][(starting_position + 1)] == piece &&
      @board_arr[(starting_column + 2)][(starting_position + 2)] == piece &&
      @board_arr[(starting_column + 3)][(starting_position + 3)] == piece ||
      @board_arr[(starting_column + 1)][(starting_position - 1)] == piece &&
      @board_arr[(starting_column + 2)][(starting_position - 2)] == piece &&
      @board_arr[(starting_column + 3)][(starting_position - 3)] == piece 
      return true      
    end
  end


  def winning_diagonal?(piece)
    @board_arr.each_with_index do |column, col_number|
      column.each_with_index do |blank, position|
        if col_number == 4
          return false
        elsif blank == piece &&
          diagonal_steps?(piece, col_number, position)
          return true                
        end
      end
    end
  end


  def winning_horizontal?(piece)
    @board_arr.each_with_index do |column, col_number|
      column.each_with_index do |blank, position|
        if col_number == 4
          return false
        elsif blank == piece &&
          @board_arr[(col_number + 1)][position] == piece &&
          @board_arr[(col_number + 2)][position] == piece &&
          @board_arr[(col_number + 3)][position] == piece
          return true
        end
      end
    end
  end


  def winning_vertical?(piece)
    @board_arr.each_with_index do |column, col_number|
      column.each_with_index do |blank, position|
        if blank == piece &&
          column[(position + 1)] == piece &&
          column[(position + 2)] == piece &&
          column[(position + 3)] == piece
          return true
        end
      end
    end
    return false
  end
  
end
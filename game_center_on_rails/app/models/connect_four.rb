class ConnectFour #< ActiveRecord::Base

  attr_reader :board

  def initialize(obj)
    obj ? @board = obj : @board = build_board
    @piece = "O"
  end

  def build_board  #top right= row 0, col 0; bottom left= row 5, col6
    for row in (0..5)
      board<<[]
      for column in (0..6)
        board[row][column]="_"
      end
    end
    board
  end

  def move(input)
    row, col = define_column_row(input)
    make_move(row, col)
  end

  def make_move(row, col)
    @board[row][col-1] = @piece
  end


  def game_over?(symbol)
    winning_combo?(symbol) || tie?
  end

  def win?
    game_over?(@piece)
    # true
  end

  private


  def define_column_row(input)
    col=input

    # until check?(col)
    #   col=get_input
    # end
    row=find_row(col)

    return row, col
  end


  def check?(col)
    arr = []
    5.downto(0) do |row|
      arr << @board[row][col-1]
    end
    empty_space = arr.include?("_")
    #flash.now "This column is full!" unless empty_space
   (col < 8 && col > 0 &&  empty_space)
  end

  def find_row(col)
    row = 5
    while @board[row][col-1] != "_"
        if row < 0
          #puts "Counted down 0"
          break
        else
         row -= 1
       end
    end
    row
  end


  def winning_combo?(symbol)
    vertical_win?(symbol) || horizontal_win?(symbol) || diagonal_left_win?(symbol) || diagonal_right_win?(symbol)
  end

  def tie?
    for row in (0..5) #rows
      for column in (0..6) #columns
        return false if @board[row][column] == "_"
      end
    end
    #flash.now puts "No more moves! It's a tie."
    true
  end

  def vertical_win?(symbol)

    0.upto(6) do |col|
      0.upto(2) do |row|
        if [@board[row][col],@board[row+1][col],@board[row+2][col],@board[row+3][col]].all?  {|place| place == symbol}
          return true
        end
      end
    end

    false
  end

  def horizontal_win?(symbol)
    @board.each do |row|
      0.upto(3) do |index|
        if row[index..index+3].all? {|place| place == symbol}
          return true
        end
      end
    end
    false
  end

  def diagonal_left_win?(symbol)

    6.downto(3) do |col|
      5.downto(3) do |row|
        break if !(0..5).include?(row-3) || !(0..6).include?(col-3)
        if [@board[row][col],@board[row-1][col-1],@board[row-2][col-2],@board[row-3][col-3]].all?  {|place| place == symbol}
          return true
        end
      end
    end
    false
  end

  def diagonal_right_win?(symbol)
    #top right= row 0, col 0; bottom left= row 5, col6
    0.upto(3) do |col|
      5.downto(3) do |row|
        break if !(0..5).include?(row-3) || !(0..6).include?(col+3)
        if [@board[row][col],@board[row-1][col+1],@board[row-2][col+2],@board[row-3][col+3]].all?  {|place| place == symbol}
          return true
        end
      end
    end
    false
  end

end

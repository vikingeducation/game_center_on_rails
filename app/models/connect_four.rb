class ConnectFour
  attr_reader :active_board

  def initialize(new_board = nil)
    if new_board.nil?
      @active_board = build_board
    else
      @active_board = new_board
    end
  end

  def add_piece(column, player_color)
    row = find_available_row(column)
    @active_board[row][column] = player_color
  end

  def find_available_row(column)
    (0..5).each do |i|
      if @active_board[i][column].nil?
        return i
      end
    end
  end

  def build_board
    Array.new(6) { Array.new(7, nil) }
  end

  def col_full?(column)
    @active_board.transpose[column].none?{|row|row.nil?}
  end

  def game_over?
    horizontals || verticals || diagonals
  end

  def board_full?
    @active_board.flatten.none?{|square| square.nil?}
  end

  private
  def verticals
      @active_board.transpose.each do |column|
        idx=0
          while idx <= column.length-4
            #create a subarray starting at idx with length 4
            sub_arr = column[idx, 4] 
            #check if all four elements in the subarray are the same
            
            return true if sub_arr.all? {|e| e==session[:player]}
            idx+=1
          end
      end
      return false
    end

    def horizontals
      @active_board.each do |row|
        idx=0
        if row.count("red")+row.count("black")>=4
          while idx<3
            sub_arr = row[idx, 4]
           
            return true if sub_arr.all?{|e| e==session[:player]}
            
            idx+=1
          end
        end
      end
      return false
    end

    def diagonals
      #up-diagonals
      (0..3).each do |x|
        (0..2).each do |y|
          diagonal=[]
          (0..3).each do |increment|
            diagonal << @active_board[x+increment][y+increment]
          end
   
          return true if diagonal.all?{|e| e==session[:player]}
         
        end
      end
      #down-diagonals
      (0..3).each do |x|
        (3..5).each do |y|
          diagonal=[]
          (0..3).each do |decrement|
            diagonal << @active_board[x+decrement][y-decrement]
          end
          
          return true if diagonal.all?{|e| e==session[:player]}
          
        end
      end
      return false
    end





end

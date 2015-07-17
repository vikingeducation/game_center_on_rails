class ConnectFourGame

  attr_reader :board

  def initialize(game_board = [], current_player = nil)
    @board = Board.new(game_board)
    if current_player
      @player1 = current_player
      @player2 = AI.new("Player 2", "o", @board)
    else
      @player1 = Human.new("Player 1", "x", @board)
      @player2 = AI.new("Player 2", "o", @board)
    end
  end


  def add_piece(column)
    if @board[column].size >= 6
      "Board is full"
    else
      @board[column] << @player.piece
    end
  end

  def game_over?
    @board.check_victory? || @board.full?
  end

 def create_players(choice)

   if choice == 1
     @player1 = Human.new("Player 1", "x", @board)
     @player2 = AI.new("Player 2", "o", @board)
   else
     @player1 = Human.new("Player 1", "x", @board)
     @player2 = Human.new("Player 2", "o", @board)
   end

 end

 def game_over?
   @board.check_victory? || @board.full?
 end

 def switch_player

   if @current_player == @player1
     @current_player = @player2
   else
     @current_player = @player1
   end

 end

end


class Board
  attr_reader :game_board

  def initialize(board = [])
    if board.empty?
      create_new_board
    else
      @game_board = board
    end
  end

  def create_new_board
    @game_board = Array.new(7) {[]}
  end


  def add_piece(column, piece)

    if @game_board[column-1][0] == "-"
      @game_board[column-1].length.downto(0) do |i|
        if @game_board[column-1][i] == "-"
          @game_board[column-1][i] = piece 
          break
        end
      end
      return true
    else
      puts "This column is full, you can not add more pieces in it."
    end

  end

  def full?

    @game_board.each do |col|
      return false if col.include?("-")
    end

    return true

  end

  def check_victory?

    check_vertical?(@game_board) || check_horizontal?(@game_board) || check_diagonal?(@game_board)

  end

  def check_vertical?(board)

    board.each do |column|

      num_consec = 0

      current = column[0]

      column.each_with_index do |element, i|

        if element == "-"
          num_consec = 0
          current = column[i+1]
          next
        end

        if element == current
          num_consec += 1
          return true if num_consec >= 4
        else
          num_consec = 1
          current = element
        end

      end
    end
    return false
  end

  def check_horizontal?(board)

    check_vertical?(board.transpose)

  end

  def check_diagonal?(board)

    check_diagonal_helper(board, 1) || 
    check_diagonal_helper(board, -1)

  end



  def check_diagonal_helper(board, step)

    #p board

    (0..6).each do |c|

      (0..5).each do |r|

        current = board[c][r]

        num_consec = 0

        col = c

        row = r

        6.times do

          if board[col][row] == "-"
            num_consec = 0
            current = board[col+1][row+step] if (0..6).include?(col+1) && (0..5).include?(row+step)
          elsif board[col][row] == current
            num_consec += 1
            #puts num_consec
            return true if num_consec >= 4
          else
            num_consec = 1
            current = board[col][row]
          end

          col += 1
          row += step

          break if col >= 7 || row >= 6 || col < 0 || row < 0

        end
      end
    end
    return false
  end

end

class Player
  attr_reader :name, :piece

  def initialize(name, piece, board)

    @name = name
    @piece = piece
    @board = board

  end

end

class Human < Player

end


class AI < Player

  def get_move

    loop do

      break if @board.add_piece(generate_move, @piece)

    end
  end

  def generate_move

    (1..7).each do |column|

      board_copy = []

      @board.game_board.each { |col| board_copy << col.dup }

      if test_piece(column, @piece, board_copy)

        if @board.check_vertical?(board_copy) ||
        @board.check_horizontal?(board_copy) ||
        @board.check_diagonal?(board_copy)
          return column
        end

      end

    end

    return rand(1..7)

  end

  def test_piece(column, piece, test_board)

    if test_board[column-1][0] == "-"
      test_board[column-1].length.downto(0) do |i|
        if test_board[column-1][i] == "-"
          test_board[column-1][i] = piece
          break
        end
      end
      return true
    else
      return false
    end

  end



end

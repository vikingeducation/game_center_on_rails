require_relative 'board.rb' 
require_relative 'player.rb' 
require_relative 'human.rb' 
require_relative 'computer.rb'

class ConnectFour
  attr_accessor :player_1, :player_2, :board

  def initialize(board = nil)
    @board_object = Board.new(board)
    @board.setup
    #@board.test_left
    @player_1 = Human.new("R")
    @player_2 = Computer.new("B")
  end

  def play_connect_four



    player = @player_2


    #until @board.win?(player.row, player.column) || @board.draw?(player.row, player.column) do

      if @player_2.is_a? Computer
        @player_2.board.board = @board.board
      end



      (puts "Column is full") if @board.column_full?(player.column)
      player = switch_player(player)

      puts "It is #{player.color}'s turn"
      if !player.add_piece(player.select_move, @board)
        player = switch_player(player)
      else
        next
      end
    end

    if @board.win?(player.row, player.column)
      puts win_message
    elsif @board.draw?(player.row, player.column)
      puts draw_message
    end

  end

  def board_setup
    @
  end

  def display_instructions
    puts "==========================================================="
    puts "Welcome to Connect four!"
    puts "The objective is to get four pieces in a row."
    puts "You can get them horizontally, vertically, or diagonally."
    puts "The columns are labeled 1-7 starting from the left."
    puts "==========================================================="
  end

  def color_prompt
    puts "Please select a color, R for red and B for black: "
    color = gets.chomp.upcase
    if color == "R" || color == "B"
      @player_1 = Human.new(color)
    else
      color_prompt
    end
  end

  def opponent_prompt(color)
    puts "Please select your opponent (type 1 for human, 2 for computer): "
    opponent = gets.chomp
    if opponent == "1" || opponent == "2"
      opponent == "1" ? @player_2 = Human.new(opponent_color(color)) : @player_2 = Computer.new(opponent_color(color))
    else
      opponent_prompt(color)
    end
  end

  # Sets opponent color to opposite of player's
  def opponent_color(color)
    color == "B" ? "R" : "B"
  end

  def switch_player(player)
    player == @player_1 ? player = @player_2 : player = @player_1
  end
  

end

# game = ConnectFour.new

# game.play_connect_four
class Connect4 < ActiveRecord::Base
  require_relative "board"
  require_relative "player"
  require_relative "human"
  require_relative "computer"

  def initialize(board = nil)
    @game_board = Board.new(board)
    @player_one =  Human.new("Phillip", :x)
    @player_two = Human.new("Adrian", :o)
    @current_player = @player_one
  end

  def play
    setup_game

    while !game_over?
      @game_board.render
      user_input_col = ask_for_and_validate_move
      @game_board.add_piece(user_input_col, @current_player.piece)

      next_player if !game_over?
    end
    @game_board.render
    display_end_of_game_message
  end

  def setup_game
    puts "\n#{@player_one.name} is the Current player represented by piece: #{@player_one.piece} "
    puts "#{@player_two.name} is the AI player represented by piece: #{@player_two.piece} \n\n"
  end

  def ask_for_and_validate_move
    loop do
      column_num = @current_player.take_turn
      if @game_board.column_full?(column_num)
        puts "That column is already full. Please enter a new one."
      else
        return column_num
      end
    end
  end

  def next_player

    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def game_over?
    check_victory || check_draw
  end

  def check_victory
    @game_board.winning_combination?
  end

  def check_draw
    @game_board.full?
  end

  def display_end_of_game_message
    puts "#{@current_player.name} wins the game, congratulations!" if check_victory
    puts "It's a tie, you're all losers!!" if check_draw
    puts "Thanks for playing! Goodbye!"
  end
end

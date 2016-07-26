#from VCS solution
class Game
  def initialize(game_type=nil)
    @board = Board.new
    @player1 = Player.new(@board, "\u{2686}")
    game_type ||= choose_game_type
    game_type == 1 ? @player2 = ConnectFourAI.new(@board, "\u{2688}") : @player2 = Player.new(@board, "\u{2688}")
  end


  def choose_game_type
    puts "Welcome to Connect Four!"
    puts ""
    choice = nil

    loop do
      puts "#################################################"
      puts "Select the game number that you'd like to play:"
      puts "1)Single player VS. AI\n2)Two player"
      puts "#################################################"

      choice = gets.chomp.to_i  
      break if [1, 2].include?(choice)
    end

    choice
  end

  def play
    player = @player1

    loop do
      @board.render
      player.move
      player = swap_players(player)

      break if connect_four? || draw?
    end

    game_over(player)
  end

  def swap_players(player)
    player == @player1 ? @player2 : @player1
  end

  def connect_four?
    @board.has_victory?
  end

  def draw?
    @board.is_draw?
  end

  def game_over(board)
    board.has_victory?
  end

end
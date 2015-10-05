class ConnectFour

  attr_reader :board, :end_game_message


  def initialize(board_arr)
    @board = Board.new(board_arr)
  end


  def step(player_move)
    player_move(player_move)
    if @end_game_message
      return
    else
      computer_move
    end
  end


  private


  def player_move(player_move)
    @board.add_piece(player_move, "red")

    if @board.winning_line?("red")
      @end_game_message = "Player won!"
    elsif @board.full?
      @end_game_message = "Its a Draw!"
    end
  end


  def computer_move
    computer = ComputerPlayer.new(@board.board_arr)
    computer_move = computer.make_move
    @board.add_piece(computer_move, "blue")
    
    if @board.winning_line?("blue")
      @end_game_message = "Computer won!"
    elsif @board.full?
      @end_game_message = "Its a draw!"
    end
  end
  
  
end
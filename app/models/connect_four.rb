class ConnectFour

  attr_reader :board, :state


  def initialize(board_arr)
    @board = Board.new(board_arr)
  end


  def step(player_move)
    player_move(player_move)
    if @state
      return
    else
      computer_move
    end
  end


  private


  def player_move(player_move)
    @board.add_piece(player_move, "red")

    if @board.winning_line?("red")
      @state = "Player won!"
    elsif @board.full?
      @state = "Its a Draw!"
    end
  end


  def computer_move
    ai = Ai.new(@board.board_arr)
    ai_move = ai.make_move
    @board.add_piece(ai_move, "blue")
    
    if @board.winning_line?("blue")
      @state = "Computer won!"
    elsif @board.full?
      @state = "Its a draw!"
    end
  end
  
  
end
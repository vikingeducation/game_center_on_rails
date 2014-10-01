class ConnectFourController < ApplicationController

  # Set up a brand new game board
	def new
    @current_player = 'x'
    @current_board = Board.blank_board
    save_player
    save_current_board
		render :game_board
	end

  # Handle submitted moves
  # Assume successful move for now
	def drop_piece
    @current_player = retrieve_current_player

    @board = Board.new(retrieve_current_board)

  	@board.drop_piece(retrieve_move, @current_player)
   

    @game_over = game_over

    switch_player
    save_player
    save_current_board

		render :game_board
	end

  private

  # switch the current player
  def switch_player
    @current_player = (@current_player == 'x' ? 'o' : 'x')
  end

  # pull the current player from the session
  def retrieve_current_player
    session[:current_player]
  end

  # save the current player in the session
  def save_player
    session[:current_player] = @current_player
  end 

  def retrieve_move
  	params[:move].strip.to_i
  end

  def save_current_board
  	session[:saved_board] = @current_board
  end

  def retrieve_current_board
  	session[:saved_board]
  end

   def game_over
    if @board.check_win
      @game_over = "Game over, player #{@current_player} WINS!"
    elsif @board.full?
      @game_over = "Game Over! You've drawn."
    end
  end

end

class TicTacToeController < ApplicationController

  # Set up a brand new game board
  def new
    @current_player = 'X'
    @board = TicTacToeBoard.new
    @board_grid = @board.grid

    save_player
    save_board_grid
    render :game_board
  end

  # Handle submitted moves
  def make_move
    @current_player = retrieve_current_player

    # Make @board the only place where our board_arr
    # lives for now so we don't get confused by @board_arr
    @board = TicTacToeBoard.new(retrieve_board)
    @board.add_piece(retrieve_coords, @current_player)

    # Check for game-ending conditions
    @game_over = game_over_message

    # Now pass our board array back to the view and save everything we want to save
    @board_grid = @board.grid
    switch_player
    save_player
    save_board_grid

    render :game_board
  end

  private

  # switch the current player
  def switch_player
    @current_player = (@current_player == 'X' ? 'O' : 'X')
  end

  # pull the current player from the session
  def retrieve_current_player
    session[:current_player]
  end

  # save the current player in the session
  def save_player
    session[:current_player] = @current_player
  end

  # save the board into the session
  def save_board_grid
    session[:saved_board_grid] = @board.grid
  end

  # pull the board from the session
  def retrieve_board
    session[:saved_board_grid]
  end

  # Grab and clean up the coordinates our form submitted
  def retrieve_coords
    params[:move].split(",").map(&:to_i)
  end

  def game_over_message
    if @board.winning_combination?(@current_player)
      @game_over = "Game over, player #{@current_player} WINS!"
    elsif @board.full?
      @game_over = "Game Over! You've drawn."
    end
  end
end

class ConnectFourController < ApplicationController

  # Set up a brand new game board
	def new
    @current_player = 'X'
    save_player
		render :game_board
	end

  # Handle submitted moves
  # Assume successful move for now
	def drop_piece
    @current_player = retrieve_current_player

    # TODO: add logic here to play the turn

    switch_player
    save_player
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

end

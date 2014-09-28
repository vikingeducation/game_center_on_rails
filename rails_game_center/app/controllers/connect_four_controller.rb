class ConnectFourController < ApplicationController

  NUM_COLS = 7
  NUM_ROWS = 6

  def new
    init_session_variables
    redirect_to connect_four_play_turn_path

  end

  def play_turn
    
    #main board and submissions form.
    #like an EDIT
    load_session_variables


  end

  def show
    #game ending, no submissions allowed
  end

  def drop_piece
    #handles POSTS from move form

    #talks to controller, validates move

    #redirects to play_turn if game ongoing
    #redirects to show if game over
  end

  private

  def init_session_variables
    @board_arr = Array.new(NUM_COLS) { Array.new(NUM_ROWS){ nil } }
    session[:board] = @board_arr

    @player1 = {type: "human" , play_piece: "X"}
    session[:player1] = @player1
    @player2 = {type: "AI", play_piece: "O"}
    session[:player2] = @player2
  end

  def load_session_variables
    @num_cols = NUM_COLS
    @num_rows = NUM_ROWS

    @board_arr = session[:board]

    @player1 = session[:player1]
    @player2 = session[:player2]
  end
end

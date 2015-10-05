class ConnectFourController < ApplicationController

  def new
    @board_arr = Board.new.board_arr
    @full_columns = []
    
    save_board

    render :game_board
  end


  def make_move
    game = ConnectFour.new(retrieve_board)

    player_move = retrieve_col
    
    if player_move.nil?
      @board_arr = game.board.board_arr
      @full_columns = game.board.full_columns
      render :game_board
    else
      game.step(player_move)

      @board_arr = game.board.board_arr
      @full_columns = game.board.full_columns
 
      if game.state
        @game_over_msg = game.state
        render :game_board
      else
        save_board
        render :game_board
      end

    end

  end


  private


  def retrieve_col
    if params[:col]
      params[:col].to_i 
    end
  end


  def save_board
    session[:saved_board] = @board_arr
  end


  def retrieve_board
    session[:saved_board]
  end

end

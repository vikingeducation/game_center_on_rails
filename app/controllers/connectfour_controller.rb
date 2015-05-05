class ConnectfourController < ApplicationController
  def new
    @current_player = 'Human'
    @game = ConnectFour.new.board
    save_player
    save_board

    render :game_board
  end

  def drop_piece
    @move = ConnectFour.new(get_board)
    if @move.column_full?(get_column)
      @message = "Column full! Try again."
      @game = @move.board

      save_player
      save_board
    else
      @move.make_move(get_column, ' R ')
      @current_player = get_player
      if @move.player_won?
        @game_over = "Game over, you win!"
      elsif @move.is_full?
        @game_over = "Game over, it's a draw!"
      end
      switch_player
      @current_player = get_player
      @move.tachikoma_move
      if @move.player_won?
        @game_over = "Game over, Tachikoma wins!"
      elsif @move.is_full?
        @game_over = "Game over, it's a draw!"
      end
      @game = @move.board

      save_player
      save_board
    end

    render :game_board
  end

  def save_board
    session[:saved_board] = @game
  end

  def save_player
    session[:current_player] = @current_player
  end

  def switch_player
    @current_player = @current_player == 'Human' ? 'Tachikoma' : 'Human'
  end

  def get_player
    session[:current_player]
  end

  def get_board
    session[:saved_board]
  end

  def get_column
    params[:move].to_i
  end
end

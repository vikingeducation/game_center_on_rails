class ConnectfourController < ApplicationController
  def new
    @current_player = 'Human'
    @game = ConnectFour.new.board
    save_player
    save_board

    render :game_board
  end

  def win_checks
    if @move.player_won?
      @game_over = "Game over, #{@current_player} wins!"
      @game = @move.board
      save_board
      render :game_board
      true
    elsif @move.is_full?
      @game_over = "Game over, it's a draw!"
      @game = @move.board
      save_board
      render :game_board
      true
    end
  end

  def drop_piece
    @move = ConnectFour.new(get_board)
    if @move.column_full?(get_column)
      @message = "Column full! Try again."
      @game = @move.board

      save_player
      save_board
    else
      @current_player = get_player
      @move.make_move(get_column, ' R ')
      return if win_checks

      switch_player
      @move.tachikoma_move
      return if win_checks

      @game = @move.board

      switch_player
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
    if @current_player == 'Human'
      @current_player = 'Tachikoma'
    elsif @current_player == 'Tachikoma'
      @current_player = 'Human'
    end
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

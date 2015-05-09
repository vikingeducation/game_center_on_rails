class ConnectfourController < ApplicationController
  def new
    @current_player = 'Human'
    @game_board = ConnectFour.new.board
    save_player
    save_board

    render :game_board
  end

  def drop_piece
    @move = ConnectFour.new(retrieve_board)
    @current_player = retrieve_player
    if @move.column_full?(retrieve_column)
      @message = 'Column full! Try again.'
      @game_board = @move.board
    else
      @move.make_move(retrieve_column, ' R ')
      if win_checks
      else
        switch_player
        @move.tachikoma_move
        if win_checks
        else
          @game_board = @move.board

          switch_player
        end
      end
    end
    @game_board = @move.board
    save_player
    save_board
    render :game_board
  end

  def win_checks
    if @move.player_won?
      @game_over = "Game over, #{@current_player} wins!"
    elsif @move.full?
      @game_over = "Game over, it's a draw!"
    end
  end

  def save_board
    session[:saved_board] = @game_board
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

  def retrieve_player
    session[:current_player]
  end

  def retrieve_board
    session[:saved_board]
  end

  def retrieve_column
    params[:move].to_i
  end
end

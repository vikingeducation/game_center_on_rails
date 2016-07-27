class ConnectFoursController < ApplicationController

  def new
    @board = ConnectFour.new.active_board
    save_session(@board, "red")
  end

  def create
    @board = ConnectFour.new(session[:board])
    @board.add_piece(params[:column].to_i, session[:player])
    @active_board = @board.active_board
    @message =nil
    if @board.game_over?(session[:player])
      @message = "Game over!"
    else
      save_session(@active_board, session[:player])
    end
    render 'play'
  end

  private

    def save_session(board, player)
      player == "red" ? session[:player] = "black" : session[:player] = "red"
      session[:board] = board
    end

end

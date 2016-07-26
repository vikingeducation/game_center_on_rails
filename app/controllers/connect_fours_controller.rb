class ConnectFoursController < ApplicationController

  def new
    @board = ConnectFour.new.active_board
    save_session(@board, "red")
  end

  def create
    @board = ConnectFour.new(session[:board])
    @board.add_piece(params[:column].to_i, session[:player])
    @board = @board.active_board
    save_session(@board, session[:player])
    render 'play'
  end

  private

    def save_session(board, player)
      player == "red" ? session[:player] = "black" : session[:player] = "red"
      session[:board] = board
    end

end

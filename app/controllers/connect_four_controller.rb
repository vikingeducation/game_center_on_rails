class ConnectFourController < ApplicationController
  def new
    @connect_four = ConnectFour.new
    session[:board] = @connect_four.board
    redirect_to '/game'
  end

  def game
    @connect_four = ConnectFour.new(session[:board])
  end

  def drop_piece
    @connect_four = ConnectFour.new(session[:board])
    @connect_four.player_move(params[:column].to_i)
    session[:board] = @connect_four.board
    if @connect_four.win?
      session[:player_won?] = true
      redirect_to '/game-over' and return
    end
    @connect_four.random_computer_move
    session[:board] = @connect_four.board
    if @connect_four.win?
      session[:player_won?] = false
      redirect_to '/game-over' and return
    end
    redirect_to '/game'
  end

  def game_over
    @connect_four = ConnectFour.new(session[:board])
  end
end

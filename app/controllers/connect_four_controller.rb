class ConnectFourController < ApplicationController
  def index
    session[:board] = Array.new(7){Array.new(0)}
  end

  def make_move
    @game = ConnectFour.new(params[:move], session[:board])
    @message = @game.message
    #if @game.gameover?
    @board_render = @game.board
    session[:board] = @game.board
    render :index
  end

  def save_board
    session[:board] = @game.board
  end
end

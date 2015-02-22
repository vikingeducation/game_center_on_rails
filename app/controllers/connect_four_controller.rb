class ConnectFourController < ApplicationController
  def index
    session[:board] = Array.new(7){Array.new(0)}
  end

  def make_move
    @var = ConnectFour.new(params[:move], session[:board])
    @message = @var.message
    #if @var.gameover?
    @board_render = @var.board
    session[:board] = @var.board
    render :index
  end
end

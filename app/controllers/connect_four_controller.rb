class ConnectFourController < ApplicationController
  def index
  end

  def make_move
    @var = ConnectFour.new(params[:move], session[:board])
    @message = @var.message
    #if @var.gameover?
    session[:board] = @var.board
    redirect_to connect_four_path
  end
end

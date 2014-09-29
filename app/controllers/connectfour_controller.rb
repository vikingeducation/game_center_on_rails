class ConnectfourController < ApplicationController

  def index
    @c4board = Connectfour.new(session[:board])
    @c4array = @c4board.board # for the view
    session[:player] ||= 'X'
    @game_over = @c4board.check_victory # for the view
  end

  def create
    @c4board = Connectfour.new(session[:board])
    @c4board.make_move(params[:connectfourchoices], session[:player])
    flash[:success] = "Player #{session[:player]} wins" if @c4board.check_victory
    session[:player] = (session[:player] == 'X' ? 'O' : 'X')
    redirect_to connectfour_path
  end

  def new
    session[:board] = Connectfour.new.board
    redirect_to connectfour_path
  end
end
class ConnectfourController < ApplicationController

  def index
    session[:player] = 'X' unless session[:player]

    if session[:board]
      @c4array = session[:board] #array
    else
      @c4array = Connectfour.new.board # board
      session[:board] = @c4array #array
    end
  end

  def create
    @c4board = Connectfour.new(session[:board]) #board
    if @c4board.make_move(params[:connectfourchoices], session[:player]) #board
      if @c4board.check_victory(params[:connectfourchoices])
        flash[:success] = "Player #{session[:player]} wins"
        redirect_to gameover_path
      else
        session[:player] = (session[:player] == 'X' ? 'O' : 'X')
        redirect_to connectfour_path
      end
    else
      flash[:error] = 'Invalid move'
      redirect_to connectfour_path
    end
  end

  def gameover
    @c4array = session[:board]
  end

  def new
    reset_session
    redirect_to connectfour_path
  end

end
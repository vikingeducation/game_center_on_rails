class ConnectfourController < ApplicationController

  def index
    session[:player] = 'X' unless session[:player]

    if session[:board]
      @c4array = JSON.parse(session[:board]) #hash
    else
      @c4board = Connectfour.new # board
    end

    if session[:board]
      session[:board] = @c4array.to_json #string
    else
      session[:board] = @c4board.to_json #string
    end
  end

  def create
    @c4array = JSON.parse(session[:board])["board"] #array
    @c4board = Connectfour.new(@c4array) #board
    if @c4board.make_move(params[:connectfourchoices], session[:player]) #board
      session[:board] = @c4board.to_json #string
      if @c4board.check_win
        flash[:success] = "Player #{session[:player]} wins" 
        redirect_to gameover_path
      end
      session[:player] = (session[:player] == 'X' ? 'O' : 'X')
    else
      flash[:error] = 'Invalid move'
    end
    redirect_to connectfour_path
  end

  def gameover
  end
  
end
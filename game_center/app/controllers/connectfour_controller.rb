class ConnectfourController < ApplicationController

  def index
    session[:player] = 'X' unless session[:player]

    if session[:board]
      @c4array = JSON.parse(session[:board]) #hash
      session[:board] = @c4array.to_json #string
    else
      @c4board = Connectfour.new # board
      session[:board] = @c4board.to_json
      @c4array = @c4board
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
    @c4array = JSON.parse(session[:board])["board"]
  end

end
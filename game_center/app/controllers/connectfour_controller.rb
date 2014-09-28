class ConnectfourController < ApplicationController

  def index
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
    if @c4board.is_valid?(params[:connectfourchoices])
      @c4board.make_move(params[:connectfourchoices])
      session[:board] = @c4board.to_json #string
      redirect_to connectfour_path
    else
      flash.now[:error] = "That move was invalid!"
      render :index
    end
  end
end
class ConnectfourController < ApplicationController

  def index
    if session[:board]
      @c4board = JSON.parse(session[:board])
    else
      @c4board = Connectfour.new.board
    end
    session[:board] = @c4board.to_json
  end

  def create
    @c4board = JSON.parse(session[:board])
    @c4board.make_move(params[:connectfourchoices])
    session[:board] = @c4board.to_json
    redirect to connectfour_path
  end

end
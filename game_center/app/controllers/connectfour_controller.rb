class ConnectfourController < ApplicationController

  def index
    @c4game = connectfour.new
    @playerchoice = session[:moves]
    session[:board] = @c4game.to_json
    make_move(@playerchoice)
  end

  def create
    session[:moves] = params[:connectfourchoices]
    redirect to connectfour_path
  end

end
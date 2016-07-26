class ConnectFourController < ApplicationController

  def index
    if session[:board] == nil
      session[:board] = Array.new(7) { Array.new(6) }
    end
    @board = session[:board]
  end


  def new
    reset_session
    redirect_to connect_four_index_path
  end
end

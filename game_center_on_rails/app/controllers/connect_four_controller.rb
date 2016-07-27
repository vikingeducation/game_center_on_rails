class ConnectFourController < ApplicationController
  include ConnectFourHelper

  def index
    if session[:board] == nil
      session[:full_columns] = []
      session[:board] = Array.new(7) { Array.new(6) }
    end
    @board = session[:board]
    @full_columns = session[:full_columns]
    @winner = session[:winner]
  end

  def create
    execute_player_move(whitelisted_params[:move].to_i)
    play_out_rest_of_move
  end


  def new
    reset_session
    redirect_to connect_four_index_path
  end


end

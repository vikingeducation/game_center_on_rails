class ConnectFourController < ApplicationController
  include ConnectFourHelper
  
  def index
    if session[:board] == nil
      session[:full_columns] = []
      session[:board] = Array.new(7) { Array.new(6) }
    end
    @board = session[:board]
    @full_columns = session[:full_columns]
  end

  def create
    board = session[:board]
    board = add_piece(board, whitelisted_params[:move].to_i)
    board = add_computer_piece(board)
    session[:board] = @board
    redirect_to connect_four_index_path
  end


  def new
    reset_session
    redirect_to connect_four_index_path
  end


end

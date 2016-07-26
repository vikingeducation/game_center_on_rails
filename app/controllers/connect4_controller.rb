class Connect4Controller < ApplicationController

  def new
    @connect4 = Connect4.new
    session[:board] = @connect4.game_board.game_board
  end

  def edit
    @connect4 = Connect4.new(session[:board])
  end

  def update
    column_number = params[:column_number].to_i
    @connect4 = Connect4.new(session[:board])
    @connect4.game_board.add_piece(column_number,:o)
    session[:board] = @connect4.game_board.game_board
    redirect_to :edit
  end

end

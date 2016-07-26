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
    @connect4.game_board.add_piece(rand(7)+1,:x)
    session[:board] = @connect4.game_board.game_board
    if @connect4.game_over?
      redirect_to connect4_path
    else
      redirect_to edit_connect4_path
    end
  end

  def show
    @connect4 = Connect4.new(session[:board])
    @won = @connect4.check_victory
  end

end

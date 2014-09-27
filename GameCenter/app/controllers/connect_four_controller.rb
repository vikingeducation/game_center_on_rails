class ConnectFourController < ApplicationController
  def index 

    @game = Connectfour.new(session['current_board'])
    @board = @game.board.board

    session['current_board'] = @board
    session['game'] = @game
  end 

  def select_create
        session['current_board'] = nil
    session['game'] = nil
    redirect_to connect_four_index_path
  end

  def create
    #update current board
    @game = session['game']
    @update = @game.check_move(params[:c4choice])# unless params[:c4choice].nil?
    session['current_board'] = @update.board
    redirect_to connect_four_index_path
  end


end
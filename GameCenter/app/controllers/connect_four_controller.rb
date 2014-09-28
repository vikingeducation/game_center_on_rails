class ConnectFourController < ApplicationController
  def index 
    @game = Connectfour.new(session['current_board'])
    @board = @game.board.board
    session['current_board'] = @board
    session['game'] = @game
    @current_player = session['current_player']
  end 

  def select_create
    session['current_board'] = nil
    session['game'] = nil
    @current_player = 'X'
    save_player
    redirect_to connect_four_index_path
  end

  def create #update current board
    @current_player = session['current_player']
    if make_move(@current_player)
      swap_player
    end
  end

  private

  def make_move(current)
    @game = session['game']
    @update = @game.check_move(params[:c4choice],current) unless params[:c4choice].nil?
    session['current_board'] = @update.board
    redirect_to connect_four_index_path
  end


  def swap_player
    if session['current_player'] == 'X'
      session['current_player'] = 'Y'
    else
      session['current_player'] = 'X'
    end
  end
  def save_player
    session['current_player'] = @current_player
  end


end
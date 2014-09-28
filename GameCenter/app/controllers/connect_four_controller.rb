class ConnectFourController < ApplicationController
  def index 

    @game = Connectfour.new(session['current_board'])
    @board = @game.board.board
    session['current_board'] = @board
    session['game'] = @game
    @current_player = session['current_player']
    @game_status = session['game_status']
    flash[:status] = "Game over? #{@game_status}"
  end 

  def select_create #fired when we pick number of players
    #this is a good place to reset all variables
    session['current_board'] = nil
    session['game'] = nil
    session['game_status'] = false
    @current_player = 'X'
    save_player
    redirect_to connect_four_index_path
  end

  def create #update current board
    @current_player = session['current_player']
    if make_move(@current_player)
      swap_player
    end
    check_game_over
    redirect_to connect_four_index_path
  end

  private

  def make_move(current)
    unless params[:c4choice].nil?
      @game = session['game']
      if @game.check_move(params[:c4choice],current) 
        @update = @game.add_piece(params[:c4choice],current) 
        session['current_board'] = @update
        session['game'] = @game
      else
        false
      end
    end

  end


  def swap_player
    session['current_player'] == 'X' ? session['current_player'] = 'Y' : session['current_player'] = 'X'
  end

  def save_player
    session['current_player'] = @current_player
  end

  def check_game_over
    @game = session['game']
    if @game.check_victory(params[:c4choice])
      session['game_status'] = true
      return true
    end
    false
  end


end
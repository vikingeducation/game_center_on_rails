module BoardsHelper

  def reset
    if params[:reset]
      session[:player] = "X"
      session[:layout] = nil
    end
  end

  def setup
    session[:player] = "X" if session[:player].nil?
    @board = Board.new(session[:layout]) || Board.new
  end

  def switch_player
    session[:player] == "X" ? session[:player] = "O" : session[:player] = "X"
  end

  def end_game
    session[:player] == "X" ? player = "Red" : player = "Blue"
    flash[:success] = "#{player} wins!"
    redirect_to root_path(:game_over => true)
  end

  def add_piece
    @last_piece = @board.add_piece(params[:column].to_i, session[:player])
  end

  def game_over?
    @board.four_connected?(@last_piece)
  end

  def invalid_move
    flash[:danger] = "Invalid move."
    redirect_to root_path
  end

  def make_move
    session[:layout] = @board.layout
    if game_over?
      end_game
    else
      switch_player
      redirect_to root_path
    end
  end

end

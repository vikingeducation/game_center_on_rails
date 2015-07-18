class ConnectFourGameController < ActionController::Base

  def index

  end

  def new
    @game = ConnectFourGame.new
    session[:board] = @game.board.game_board
  end

  def update
    @game = ConnectFourGame.new(session[:board])
    if @game.board.add_piece(params[:column], "x")
      if @game.game_over?
        flash[:win] = "Congratulations! You've won!"
      end
      @game.player2.get_move
      if @game.game_over?
        flash[:lose] = "Sorry! You've lost!"
      end
      session[:board] = @game.board.game_board
    else
      flash[:notify] = "Column is full"
    end
    redirect_to '/connect-four/play'
  end

  def show
    @game = ConnectFourGame.new(session[:board])
  end

  def win

  end

  def lose

  end

end
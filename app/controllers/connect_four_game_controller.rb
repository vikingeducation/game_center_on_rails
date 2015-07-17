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
      session[:board] = @game.boad.game_board
    else
      flash[:notify] = "Column is full"
    end
    redirect_to 'connect_four/play'
  end

  def show
    @game = ConnectFourGame.new(session[:board])
  end

end
class ConnectFoursController < ApplicationController


  def new #get
  end

  def update
    @game = load_game
    connectfour = ConnectFour.new(@game)
    connectfour.move(params[:column])
    if connectfour.win?
      flash[:success] = "You Won!"
    else
      @game = connectfour.board
      save_game
    end
      render :update
  end

end

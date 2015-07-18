class ConnectFoursController < ApplicationController


  def new #get
    @game = load_game
  end

  def edit
    @game = load_game
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
    redirect_to edit_connect_four_path
  end

  def destroy
    session["connect4"] = nil
    redirect_to root_path
  end

end

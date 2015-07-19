class ConnectFoursController < ApplicationController

  helpers

  def new #get
    @game = Array.new(6) { Array.new(7) { :_ } }
    save_game
  end

  def edit
    @game = load_game
  end

  def update
    @game = load_game
    connectfour = ConnectFour.new(@game)
    connectfour.move(params[:column].to_i)
    @game = connectfour.board
    save_game
    if connectfour.win?
      flash[:success] = "You Won!"
      redirect_to connect_four_path(1)
    else
      redirect_to edit_connect_four_path
    end
  end

  def show
    @game = load_game
  end

  def destroy
    session["connect4"] = nil
    redirect_to root_path
  end

  private

  def load_game
    if session["connect4"]
      @game = JSON.parse(session["connect4"])
    else
      @game = Array.new(6) { Array.new(7) { :_ } }
    end
  end

  def save_game
    session["connect4"] = @game.to_json
  end

end

class GamesController < ApplicationController

  CPU_COLOR = '#17202A'

  def index
  end

  def new
  end

  def show

  end

  def create
    user_color = "##{params[:game][:color]}"
    unless user_color.empty?
      session[:color] = user_color
    else
      session[:color] = "#154360"
    end
    @board = Gameboard::Board.new(width: 7, height: 6).to_yaml
    @game = SaveGame.create(board: @board)
    session[:game] = @game.id
    redirect_to(game_path(@game.id))
  end
end

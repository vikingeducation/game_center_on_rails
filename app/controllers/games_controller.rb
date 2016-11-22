class GamesController < ApplicationController

  CPU_COLOR = '#17202A'

  def index
  end

  def new
  end

  def show
    # raise
    @game = YAML.load(SaveGame.find_by_id(session[:game]).board)
  end

  def create
    user_color = "##{params[:game][:color]}"
    unless user_color.empty?
      session[:color] = user_color
    else
      session[:color] = "#154360"
    end
    # @board = Gameboard::Board.new(width: 7, height: 6).to_yaml
    example_arr = [
      ["1", "2", "3"], #=> coordinates [[0,2], [1,2], [2,2]]
      ["A", "B", "C"], #=> coordinates [[0,1], [1,1], [2,1]]
      ["X", "Y", "Z"] #=> coordinates [[0,0], [1,0], [2,0]]
    ]
    @board = Gameboard::Board.new(preset: example_arr).to_yaml
    @game = SaveGame.create(board: @board)
    session[:game] = @game.id
    redirect_to(game_path(@game.id))
  end
end

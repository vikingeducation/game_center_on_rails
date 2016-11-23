class GamesController < ApplicationController

  CPU_COLOR = '#17202A'
  USER = :x
  CPU = :y

  def index
  end

  def new
  end

  def update
    x_idx = params[:col].to_i
    @game = SaveGame.find_by_id(session[:game])
    @board = YAML.load(@game.board)
    col = @board.vertical[x_idx]
    y_idx = col.index { |cell| cell.val.nil? }
    if y_idx
      @board.set_cell([x_idx, y_idx], USER)
    else
      flash.now[:error] = 'Invalid Placement'
    end
    serialize
    @game.update(board: @board)
    redirect_to game_path(@game.id)
  end

  def show
    @game = YAML.load(SaveGame.find_by_id(session[:game]).board)
    render :show, locals: {color: session[:color], cpu: CPU_COLOR }
  end

  def create
    new_game
    redirect_to(game_path(@game.id))
  end

  private
    def new_game
      user_color = "##{params[:game][:color]}"
      unless user_color.empty?
        session[:color] = user_color
      else
        session[:color] = "#154360"
      end

      # example_arr = [
      #          [nil, nil, nil], #=> coordinates [[0,2], [1,2], [2,2]]
      #          [:x, :x, :x], #=> coordinates [[0,1], [1,1], [2,1]]
      #          [:y, :y, :y]  #=> coordinates [[0,0], [1,0], [2,0]]
      #         ]
      # @board = Gameboard::Board.new(preset: example_arr).to_yaml
      @board = Gameboard::Board.new(width: 7, height: 6).to_yaml
      @game = SaveGame.create(board: @board)
      session[:game] = @game.id
    end

    def serialize
      @board = @board.to_yaml
    end
end

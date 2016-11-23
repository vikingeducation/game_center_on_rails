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

    if check(:vertical) || check(:horizontal) || check(:diagonal)
      serialize
      @game.update(board: @board)
      redirect_to winner_path(winner: 'You Win')
    else
      set_cpu
      if check(:vertical) || check(:horizontal) || check(:diagonal)
        serialize
        @game.update(board: @board)
        redirect_to winner_path(winner: 'You Lose...')
      else
        serialize
        @game.update(board: @board)

        redirect_to game_path(@game.id)
      end
    end
  end

  def show
    @board = YAML.load(SaveGame.find_by_id(session[:game]).board)
    render :show, locals: {board: @board, color: session[:color], cpu: CPU_COLOR }
  end

  def create
    new_game
    redirect_to(game_path(@game.id))
  end

  def winner
    @game = SaveGame.find_by_id(session[:game])
    @board = YAML.load(@game.board)
    render :winner, locals: {id: @game.id, board: @board, color: session[:color], cpu: CPU_COLOR, winner: params[:winner]}
    @game.destroy
    reset_session

  end

  private

    def new_game
      user_color = "##{params[:game][:color]}"

      unless user_color.empty?
        session[:color] = user_color
      else
        session[:color] = "#154360"
      end

      @board = Gameboard::Board.new(width: 7, height: 6).to_yaml
      @game = SaveGame.create(board: @board)
      session[:game] = @game.id
    end

    def serialize
      @board = @board.to_yaml
    end

    def set_cpu
      x_idx = close_to_win || rand(6)
      col = @board.to_val(:vertical)[x_idx]
      until y_idx = col.index { |cell| cell.nil? }
        col = @board.to_val(:vertical)[rand(6)]
      end
      @board.set_cell([x_idx, y_idx], CPU)
    end

    def close_to_win
      false
      if check(:vertical, 3)
        @board.to_val(:vertical)[check(:vertical, 3)].each_cons(4) do |chunk|
          return false if chunk[-1] == :y
        end
        check(:vertical, 3)
      elsif check(:horizontal, 3)
        @board.to_val(:horizontal)[check(:horizontal, 3)].each_cons(3).with_index do |chunk, i|
          if chunk.all? {|piece| piece == chunk[0] && !piece.nil?}
            p [chunk, i]
          end
        end
        false
      end
    end
    def check(sym, size = 4)
      @board.to_val(sym).each_with_index do |column, i|
        winner = four_in_a_row(column, size)
        return i if winner && size == 3
        return winner if winner
      end
      false
    end

    def four_in_a_row(section, size = 4)
      section.each_cons(size) do |chunk|
        return chunk[0] if chunk.all? {|piece| piece == chunk[0] && !piece.nil?}
      end
      false
    end
end

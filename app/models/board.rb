class Board

  attr_reader :state

  def initialize(state = nil)
    col = 7
    row = 6
    state ||= Array.new(row) { Array.new(col) {'.'}  }
    @state = state
  end

  def make_move(col)
    @state[col.to_i][index(col)] = "X"
  end

  def comp_move
    col = rand(7)
    if col_full?(col)
      comp_move
    else
      @state[col][index(col)] = "O"
    end
  end

  def game_over?
      
  end


  private 

  def index(col)
    @state[col].index(".")
  end

  def col_full?(col)
    @state[col].all? { |c| c == "X" || c == "O" }
  end

  # [
  #   ["X"]
  #   ["O", "O"]
  #   []
  #   []
  #   []
  #   []
  # ]

end

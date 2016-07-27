class Board

  attr_reader :state, :winner

  def initialize(state = nil)
    col = 7
    row = 6
    state ||= Array.new(row) { Array.new(col) {'.'}  }
    @state = state
    @winner = nil
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
    full_vertical? ||
    full_horizontal? ||
    full_diagonal?
  end




  private

  def full_diagonal?
    diagonal_down_left? ||
    diagonal_down_right?
  end

  def diagonal_down_left?
    0.upto(2) do |row|
      3.upto(6) do |col|
        diagonal = pieces_at([
                               [row, col],
                               [row+1, col-1],
                               [row+2, col-2],
                               [row+3, col-3]
                             ])
        if diagonal.all? { |x| x == "X" }
          @winner = "X"
          return true
        elsif diagonal.all? { |x| x == "O" }
          @winner = "O"
          return true
        end
      end
    end
    false
  end

  def diagonal_down_right?
    0.upto(2) do |row|
      0.upto(3) do |col|
        diagonal = pieces_at([
                               [row, col],
                               [row+1, col+1],
                               [row+2, col+2],
                               [row+3, col+3]
                             ])
        if diagonal.all? { |x| x == "X" }
          @winner = "X"
          return true
        elsif diagonal.all? { |x| x == "O" }
          @winner = "O"
          return true
        end
      end
      false
    end
  end


  def pieces_at(arr)
    arr.map do |loc|
      @state[loc[0]][loc[1]]
    end
  end

  def full_horizontal?
    @state.transpose.each do |row|
      string = row.join
      if string.include?('XXXX')
        @winner = "X"
        return true
      elsif string.include?('OOOO')
        @winner = "O"
        return true
      end
    end
    false
  end

  def full_vertical?
    @state.each do |row|
      string = row.join
      if string.include?('XXXX')
        @winner = "X"
        return true
      elsif string.include?('OOOO')
        @winner = "O"
        return true
      end
    end
    false
  end

  def index(col)
    col = col.to_i
    @state[col].index(".")
  end

  def col_full?(col)
    @state[col].all? { |c| c == "X" || c == "O" }
  end

end

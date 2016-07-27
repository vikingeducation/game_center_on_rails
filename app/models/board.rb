class Board

  attr_reader :state, :winner

  def initialize(state = nil)
    col = 7
    row = 6
    state ||= Array.new(row) { Array.new(col) {'.'}  }
    @state = state
    @winner = nil
  end

  def comp_move
    move = rand(7)
    move = rand(7) while col_full?(move)
    @state.reverse.each do |row|
      if row[move] == '.'
        row[move] = 'O'
        break
      end
    end
  end

  def game_over?
    full_vertical? ||
    full_horizontal? ||
    full_diagonal?
  end

  def make_move(col)
    col = col.to_i
    @state.reverse.each do |row|
      if row[col] == '.'
        row[col] = 'X'
        break
      end
    end
  end

  def make_test_board
    @state[5][0] = 'X'
    @state[4][1] = 'X'
    @state[3][2] = 'X'
    @state[2][3] = 'X'
  end



  private

  def col_full?(col)
    @state.transpose[col].all? { |c| c == "X" || c == "O" }
  end

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
    end
    false
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

end

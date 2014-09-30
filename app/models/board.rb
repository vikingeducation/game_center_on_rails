class Board
  attr_reader :board

  def initialize(current_board = nil)
    @current_board = current_board || blank_board 
  end

  def self.blank_board #add self so that it automatically does stuff when called
    Array.new(7){Array.new(7)}
  end

  def check_win
    horizontal            || 
    vertical              || 
    search_diagonal       || 
    search_other_diagonal || 
    check_draw
  end

  def place_piece(move, piece)
    @current_board[move-1] << piece
  end

  def is_valid?(move)
    if move.nil? || @current_board[move-1].length < 7
      return true
    else
      return false
    end
  end
  
  def horizontal #actual rows
    horiz = []
    (0..6).each do |column|
      (0..6).each do |row|
        horiz << @board[row][column]
        horiz << "b" if @board[row][column] == nil
      end
    horiz << "b"
    end
    check_four(horiz)
  end

  def vertical #actual COLUMNS
    vertical = []
    @board.each do |column|
      column.each do |piece|
        vertical << "b" if piece == nil
        vertical << piece
      end
    vertical << "b"
    end
    check_four(vertical)
  end

  def check_four(arg)
    %w(xxxx oooo).any?{|str| arg.join.include? str}
  end

  def search_diagonal
    diagonal = []
    (0..6).each do |column|
      (0..6).each do |row|
        (0..6).each do |diag|
          unless @board[column+diag].nil?
            if @board[column+diag][row+diag].nil?
              diagonal << "b"
            else
            diagonal << @board[column+diag][row+diag]
            end
          end
        end
      end
    end
    check_four(diagonal)
  end

  def search_other_diagonal
    diagonal = []
    (0..6).each do |column|
      (0..6).each do |row|
        (0..6).each do |diag|
          unless @board[column+diag].nil?
            if @board[column-diag][row+diag].nil?
              diagonal << "b"
            else
            diagonal << @board[column+diag][row+diag]
            end
          end
        end
      end
    end
    check_four(diagonal)
  end

  def check_draw
    @board.each do |column|
      if column.length >= 7
        return true
      else
        return false
        break
      end
    end
  end
  
end
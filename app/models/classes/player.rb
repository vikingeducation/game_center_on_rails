#from VCS solution
class Player

  # component of Game class, so you don't see it
  # needs to know about the board so it can send messages there
  # needs to know its own color, but not anybody else's
  def initialize(board, color)
    @board = board
    @color = color
  end

  def move
    column = nil
    loop do
      column = get_move
      break if @board.valid_move?(column, @color)
    end
    @board.add_piece(column, @color)
  end

  private
  def get_move
    puts "Enter a column to play your piece (0-6): "
    move = gets.chomp.to_i
  end

end
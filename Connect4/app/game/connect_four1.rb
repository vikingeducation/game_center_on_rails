class ConnectFourTest

  attr_accessor :board

  def initialize(board=nil)

    @board = @board || create_board

  end

  def create_board
    @board = Array.new(6,Array.new(7,"-"))
  end 

  def drop_piece
   
    
   
  end  
  
end 
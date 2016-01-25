class Board < ActiveRecord::Base
  attr_accessor :board
  
  def initialize(board=nil)
    @board = board ? board : Array.new(6) { Array.new(7) }
  end
end

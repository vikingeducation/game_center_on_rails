class ConnectFour < ActiveRecord::Base

  def initialize(new_board=board)
    @active_board = new_board
  end

  def add_piece(column)

  end

  def find_available_row(column)
    (0..5).each do |i|
      if @active_board[[i,column]]==nil
        return i
      end
    end
  end

  def board
    board = Hash.new
    ("0".."5").each do |i|
      ("0".."6").each do |j|
        board[[i,j]]=nil
      end
    end
    board
  end
end

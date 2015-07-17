class PiecesController < ApplicationController

   
  def new
     new_board
    
  end  

  def index
        # state_board
        # session[:winner]=state_board
        # session[:winner]
        @pieces=Piece.all
  end

  def show
    
  end

  private
  def new_board
    
    for row in (0..5) #rows

      for column in (0..6) #columns
        @piece = Piece.new
        @piece.x_value = column
        @piece.y_value = row
        @piece.color = 0
        @piece.save
      end   
    end
   
  end

end

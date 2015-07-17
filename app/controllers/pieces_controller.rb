class PiecesController < ApplicationController


  def new
     new_board

     redirect_to pieces_path

  end

  def index
        # state_board
        # session[:winner]=state_board
        # session[:winner]

        @pieces=Piece.all
  end

  def reset
    Piece.all.each {|p| p.destroy}
    new_board

    redirect_to pieces_path
  end

  def move

    p = Piece.find_by(x_value: params[:move], y_value: 2)
    p.color = 1
    p.save


    redirect_to pieces_path



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

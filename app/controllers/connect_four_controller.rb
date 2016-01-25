class ConnectFourController < ApplicationController

  def new
    render :game
  end

  def drop_piece
    puts params

    # column = params[:column]
    # connectfour.place_piece(column)
    redirect_to connectfour_path
  end

end

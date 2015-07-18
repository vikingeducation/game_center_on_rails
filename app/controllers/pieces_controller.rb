class PiecesController < ApplicationController


  def new
     new_board
     redirect_to pieces_path
  end

  def index
        # state_board
        # session[:winner]=state_board
        # session[:winner]
        session[:player]||="Olga"
        @pieces=Piece.all
  end

  def reset
    Piece.all.each {|p| p.destroy}
    new_board

    redirect_to pieces_path
  end

  def move

    p = Piece.find_by(x_value: params[:move], y_value: find_y)
    if session[:player]=="Olga"
      p.color = 1
    else
      p.color = 2
    end
    p.save
    player_name_switch
    redirect_to pieces_path
  end

  def find_y
    5.downto(0) do |i|
      return i if Piece.find_by(x_value: params[:move], y_value: i).color == 0
    end
    flash.notice = "Tha column is full!"

  end

  def player_name_switch
    if session[:player]=="Olga"
      session[:player]="Joseph"
    else
      session[:player]="Olga"
    end
  end

  def full(col)
    Piece.find_by(x_value: col, y_value: 0).color != 0
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

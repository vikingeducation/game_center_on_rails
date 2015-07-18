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
    flash.notice = "#{session[:player]} won!" if vertical_win?(p.color) || horizontal_win?(p.color)||diagonal_win?(p.color)
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

  def vertical_win?(symbol)

    0.upto(6) do |col|
      0.upto(2) do |row|
        if [@field[row][col],@field[row+1][col],@field[row+2][col],@field[row+3][col]].all?  {|place| place == symbol}

          return true
        end
      end
    end

    false
  end


  def horizontal_win?(symbol)
    @field.each do |row|
      0.upto(3) do |index|
        if row[index..index+3].all? {|place| place == symbol}
          return true
        end
      end
    end
    false
  end

  def diagonal_win?(symbol) #not all checks compatible
    #top right= row 0, col 0; bottom left= row 5, col6
    0.upto(3) do |col|
      5.downto(3) do |row|
        break if !(0..5).include?(row+3) || !(0..6).include?(col-3)
        if [@field[row][col],@field[row+1][col-1],@field[row+2][col-2],@field[row+3][col-3]].all?  {|place| place == symbol}
          return true
        end
      end
    end

end

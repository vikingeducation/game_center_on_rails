module ApplicationHelper

  def column_full(col)
    Piece.find_by(x_value: col, y_value: 0).color != 0
      
  end

  def radio_button_full
    "<input type='radio' name='move' value ='0'>"
  end
end

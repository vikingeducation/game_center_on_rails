module PiecesHelper

  def params_hash
    require(:piece).permit(:move)
  end

  def convert_to_2d_array
    array << Piece.all[0..6].map {|p| p.color}
    array << Piece.all[7..13].map {|p| p.color}
    array << Piece.all[14..20].map {|p| p.color}
    array << Piece.all[21..27].map {|p| p.color}
    array << Piece.all[28..34].map {|p| p.color}
    array << Piece.all[35..41].map {|p| p.color}

    array
    end

end

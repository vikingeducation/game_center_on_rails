module BoardHelper

  def whitelisted_board_params
    params.require(:board).permit(:grid)
  end

end

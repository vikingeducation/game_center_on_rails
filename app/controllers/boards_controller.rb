class BoardsController < ApplicationController
  include BoardsHelper
  
  def show
    reset
    setup
    @game_over = params[:game_over]
  end

  def update
    @board = Board.new(session[:layout])
    unless add_piece
      invalid_move
    else
      make_move
    end
  end

end

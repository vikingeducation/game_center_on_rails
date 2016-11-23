class ConnectFourController < ApplicationController

  def new
    reset_session
    @board = GameBoard.new.board
  end

  def drop_piece
    move = params[:column].to_i
    @board = GameBoard.new
    result = @board.run(move)
    p @board = @board.board
    if result == 'X'
      # render winning page
    elsif result == 'O'
      # render losing page
    elsif result == 'draw'
      # render draw page
    else
      render :drop_piece
    end
  end

  def game_over

  end

end

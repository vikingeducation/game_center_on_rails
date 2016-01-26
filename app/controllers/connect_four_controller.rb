class ConnectFourController < ApplicationController
before_action :set_board

  def new
    render :game
  end

  def drop_piece

    column = params[:column].to_i - 1
    @game.drop_piece(column)

    save_board

    redirect_to connectfour_path
  end


  private

  def set_board
    if session[:board]
      @game = ConnectFourGame.new(session[:board])
    else
      @game = ConnectFourGame.new
    end
  end

  def save_board
    session[:board] = @game.board
  end


end

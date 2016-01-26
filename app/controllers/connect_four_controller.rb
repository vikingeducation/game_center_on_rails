class ConnectFourController < ApplicationController
  before_action :set_board, except: [:new]

  def new
    session[:board] = ConnectFourGame.new.board
    redirect_to show_game_path
  end

  def show
    render :game
  end

  def drop_piece
    column = params[:column].to_i - 1
    @game.drop_piece(column)

    save_board

    redirect_to show_game_path
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

class GameController < ApplicationController

  def destroy
  end

  def edit
    @board = session[:board] || Board.new.board
  end

  def update
  end

  def show
  end

  def index
  end

  def create
  end
end

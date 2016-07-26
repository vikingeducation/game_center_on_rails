class BoardsController < ApplicationController


  def new
    @board = Board.new
    redirect_to edit_path(@board)
  end

  def show

  end

  def edit
    redirect_to update_path(@board)
  end

  def update
    redirect_to edit_path(@board)
  end

  def create
  end

  def destroy
  end
end

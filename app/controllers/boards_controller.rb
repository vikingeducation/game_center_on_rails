class BoardsController < ApplicationController


  def new
    @board = Board.new
    session["board"] = @board
    redirect_to action: "show"
  end

  def show
    @board = Board.new
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

class BoardController < ApplicationController

  def show
    @board = Board.find(params[:id])
  end


  def new
    @board = Board.new
  end


  def create
    @board = Board.new(params[:board])
    @board.save

    redirect_to board_path
  end


  def edit
  end


  def destroy
  end




end

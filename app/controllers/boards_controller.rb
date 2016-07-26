class BoardsController < ApplicationController


  def new
  end

  def show
    board = Board.new
    @test = board.test
  end

  def update
  end

  def create
  end

  def destroy
  end
end

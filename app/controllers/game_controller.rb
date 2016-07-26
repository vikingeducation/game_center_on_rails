class GameController < ApplicationController
  
  def home
    session['board'] ||= Board.new
    
  end

  def play
  end

end

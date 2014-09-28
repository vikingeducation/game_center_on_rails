class ConnectFourController < ApplicationController

  def index
  end

  def new
    redirect_to connect_four_play_turn_path
    # clear out session var
  end

  def drop_piece
  end

  def show
  end

   def play_turn
   end

end

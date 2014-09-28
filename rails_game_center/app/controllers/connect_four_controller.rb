class ConnectFourController < ApplicationController

  def new
    redirect_to connect_four_play_turn_path
    # clear out session var
  end

  def play_turn
    #main board and submissions form.
    #like an EDIT
  end

  def show
    #game ending, no submissions allowed
  end

  def drop_piece
    #handles POSTS from move form

    #talks to controller, validates move

    #redirects to play_turn if game ongoing
    #redirects to show if game over
  end
end

class Connect4Controller < ApplicationController

  def new
    @connect4 = Connect4.new
  end

end

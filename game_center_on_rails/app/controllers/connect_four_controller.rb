class ConnectFourController < ApplicationController

  def index

  end


  def new
    reset_session
    redirect_to connect_four_index_path
  end
end

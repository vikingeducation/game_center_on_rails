class ConnectFourController < ApplicationController
  def new
    @connect_four = ConnectFour.new
  end
end

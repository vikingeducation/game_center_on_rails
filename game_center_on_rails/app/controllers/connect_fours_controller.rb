class ConnectFoursController < ApplicationController

  def new
    @game= Array(6, Array(7, "__"))
  end

end

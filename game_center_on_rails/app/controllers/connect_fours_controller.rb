class ConnectFoursController < ApplicationController

  def new
    @game= Array.new(6) {Array.new(7) {"__"}} 
  end

  def update
    params[:column]
  end

end

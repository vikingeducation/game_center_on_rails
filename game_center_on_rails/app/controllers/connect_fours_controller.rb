class ConnectFoursController < ApplicationController


  def new
    @game= Array.new(6) {Array.new(7) {"__"}}
  end

  def update
    get_input = params[:column]
  end

end

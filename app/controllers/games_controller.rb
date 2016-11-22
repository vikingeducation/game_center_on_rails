class GamesController < ApplicationController

  CPU_COLOR = '#17202A'

  def index
  end

  def new
  end

  def create
    user_color = "##{params[:game][:color]}"
    unless user_color.empty?
      session[:color] = user_color
    else
      session[:color] = "#154360"
    end

  end
end

class RpsGameController < ApplicationController
	
	def index
	end

	def new

	end

	def player_choice
		@player_choice = params[:player_choice]

	end

	def start_game
		player_choose
		computer_choose
		check_win
	end

	def player_choose()
		# @player_choice = params[:player_choice]
	end


end

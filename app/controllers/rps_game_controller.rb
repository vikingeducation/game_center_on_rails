class RpsGameController < ApplicationController

	def index

	end

	def start_game
		player_choice
		computer_choice
		check_win
	end


end

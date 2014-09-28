class ConnectFourController < ApplicationController

	def new
		render :game_board
	end

	def drop_piece
		render :game_board
	end

end

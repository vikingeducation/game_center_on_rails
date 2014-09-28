class RpsController < ApplicationController

	def new
		@game = Game.new
		session[:choice] = nil
		session[:player_count] = 0
		session[:comp_count] = 0
	end

	def index		
		@game = Game.new(session[:choice])
		@comp_choice = @game.comp_choice
		@winner = @game.winner
		@player_choice = @game.player_choice
	end

	def create
		session[:choice] = params[:player_choice]

		redirect_to rps_path
	end

	def reset

		redirect_to new_rp_path
	end


# to add feature to track play count

# def conditions
# 	if((session[:history])==nil)
# 			session[:history] = Array.new
# 	end
# 	if((session[:counter])==nil)
# 			session[:counter] = 0
# 	end
# end



end

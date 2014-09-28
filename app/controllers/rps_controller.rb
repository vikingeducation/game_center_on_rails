class RpsController < ApplicationController
	#this whole thing needs refactoring:
	#1. The route needs to route to new to begin with 
	#2. The POST needs to route to create
	#3. The index logic should actually be in "make_move" 
	#4. 
	def new
		@game = Game.new(0)
		# session[:choice] = 0
		# session[:player_count] = 0
		# session[:comp_count] = 0
		reset_session # does this replace all the above?
		render :game
	end

	def make_move	#the results were being read as strings. Line 14 changes that.
		@game = Game.new(session[:choice])
		@comp_choice = @game.comp_choice
		@player_choice = @game.player_choice
		@winner = @game.game_win(@player_choice.to_i, @comp_choice.to_i) 
		@choices = ["Rock", "Paper", "Scissors"]
		render :game
	end

	def create
		session[:choice] = params[:player_choice]
		redirect_to rps_path #refactor to render a partial
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

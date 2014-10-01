class RpsController < ApplicationController
	#this whole thing needs refactoring:
	#1. The route needs to route to new to begin with 
	#2. The POST needs to route to create
	#3. The index logic should actually be in "make_move" 
	#4. 
	def new
		@game = Game.new
		session[:count] = [0, 0]
		render :game
	end

	def make_move	#the results were being read as strings. Line 14 changes that.
		@game = Game.new(session[:choice])
		@choices = ["rock", "paper", "scissors"]

		@comp_choice = @game.comp_choice
		@player_choice = params[:player_choice].to_i #this needs to be moved??MAYBE?
		@winner = @game.game_win(@player_choice.to_i, @comp_choice.to_i) 

		render :game
	end
end

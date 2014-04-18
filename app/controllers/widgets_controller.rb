class WidgetsController < ApplicationController

	def edit
		@repo = Repo.find(params[:id])
		@widget = @repo.widget
	end

	def update
		
	end

end
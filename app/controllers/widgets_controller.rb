class WidgetsController < ApplicationController
	protect_from_forgery :except => [:edit]

	def edit
		@repo = Repo.find(params[:id])
		@widget = @repo.widget
		respond_to do |format|
			format.html
			format.js
    end
	end

	def update
		
	end

end
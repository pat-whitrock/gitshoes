class SessionsController < ApplicationController

	def create
		@user = User.find_or_create_by(token: params["code"])
	end

end

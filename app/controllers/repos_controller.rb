class ReposController < ApplicationController

	def index
		@repos = Repo.all
	end

	def new
		@repo = Repo.new
	end

	def create
		@repo = Repo.new(repo_params)
		if @repo.save
			redirect_to repos_path
		else
			render :new
		end
	end

	def show
	end

	def update
	end

	def edit
	end

	def destroy
	end

	private
		def repo_params
			params.require(:repo).permit(:address, :token)
		end

end
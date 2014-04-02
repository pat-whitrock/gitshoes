class ReposController < ApplicationController

	before_action :authenticate_user!

	def index
		@repos = current_user.repos
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
		@repo = Repo.find_by(:id => params[:id])
	end

	def update
   		@repo = Repo.find_by(:id => params[:id])
   		if @repo.update_attributes(repo_params)
   			redirect_to @repo
   		else
   			render :edit
   		end
	end

	def edit
		@repo = Repo.find(params[:id])
	end

	def destroy
	end

	private
		def repo_params
			params.require(:repo).permit(:address, :token)
		end

end
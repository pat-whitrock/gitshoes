class ReposController < ApplicationController

	def index
		@repos = current_user.repos
	end

	def new
		@repo = Repo.new
	end

	def create
		@user = current_user
		@repo = current_user.repos.build(repo_params)
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
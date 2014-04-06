class ReposController < ApplicationController
	protect_from_forgery :except => :show

	def index
		@repos = current_user.repos
		@repos_array = current_user.repos.order("name ASC").each_slice(4).to_a
	end

	def new
		@repos = current_user.github_repos
		@repo = Repo.new
	end

	def create
		@repo = Repo.new(repo_params)
		@repo.token = current_user.token
		@repo.users << current_user
		if @repo.save
			redirect_to @repo
		else
			render :new
		end
	end

	def show
		@repo = Repo.find_by(:id => params[:id])
		@widget = Widget.find_by(:id => params[:id])
		respond_to do |format|
			format.html
			format.js   # just renders messages/create.js.erb
			format.json { render json: @repo }
    end
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
		@repo = Repo.find(params[:id])
		@repo.destroy
		redirect_to repos_path
	end

	def feedback
		@repo = Repo.find(params[:id])
		respond_to do |format|
			format.js   # just renders messages/create.js.erb
			format.json { render json: @repo }
    end
	end

	private
		def repo_params
			params.require(:repo).permit(:address, :token, :name,
				:description, :language, :full_name,
				:github_created_at, :github_updated_at)
		end

end
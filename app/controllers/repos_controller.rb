class ReposController < ApplicationController
	protect_from_forgery :except => :show
	before_action :set_cache_buster, :only => [:new]

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

	def index
		@repos = current_user.repos
		@repos_array = @repos.order("name ASC").each_slice(4).to_a
	end

	def sidebar
		@repos = current_user.repos.order("name ASC").each_slice(4).to_a
	end

	def new
		current_user_repos_urls = current_user.repos.map do |repo|
			repo.address
		end
		@repos = current_user.github_repos.reject { |repo|
			current_user_repos_urls.include?(repo.html_url)
		}
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
		respond_to do |format|
			format.html { render :partial => "show"}
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
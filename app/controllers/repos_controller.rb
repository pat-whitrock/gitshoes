class ReposController < ApplicationController

	protect_from_forgery :except => [:show]
	# before_action :set_cache_buster, :only => [:new]
	skip_before_filter :authenticate_user!, :only => [:show]
	before_filter(:only => :show) do |controller|
		authenticate_user! unless controller.request.format.js?
	end

  # def set_cache_buster
  #   response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
  #   response.headers["Pragma"] = "no-cache"
  #   response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  # end

  def format_js?
  	request.format.js?
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
		repos_return = current_user.github_repos[:repos]
		
		@repos = repos_return.reject { |repo|
			current_user_repos_urls.include?(repo.html_url)
		}
		@total = @repos.count
		@repo = Repo.new
		expires_in 5.minutes, public: true
	end

	def create
		binding.pry
		if Repo.has_address?(repo_params[:address])
			Repo.where(:address => repo_params[:address]).first.users << current_user
			redirect_to repos_path
		else
			@repo = Repo.new(repo_params)
			@repo.token = current_user.token
			@repo.users << current_user
			if @repo.save
				redirect_to repos_path
			else
				# fail safe to check in case existing repo filter did not take out existing repos
				existing_repo = Repo.where(:address => repo_params[:address]).first
				existing_users = existing_repo.users.map {|user| user.id}
				if existing_users.include?(current_user.id) == false
					existing_repo.users << current_user
				end
				redirect_to repos_path
			end
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

	def preview
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
		@repo = Repo.find(params[:id])
		if @repo.users.count > 1
			UserRepo.where(:user_id => current_user.id, :repo_id => params[:id]).first.destroy
		else
			@repo.destroy
		end
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
				:github_created_at, :github_updated_at, :page)
		end

end
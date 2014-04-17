class IssuesController < ApplicationController
	protect_from_forgery :except => [:new, :show, :create]
	after_filter :set_access_control_headers
	skip_before_filter :authenticate_user!, :only => [:create, :new]

	def new
		@repo = Repo.find(params[:id])
		@issue = Issue.new
		respond_to do |format|
			format.js   # just renders messages/create.js.erb
			format.html { render :partial => "new" }
    end
	end

	def create
		@repo = Repo.find(params[:id])
		Issue.create_github_issue(issue_params, @repo)

		respond_to do |format|
			format.html { render :partial => "create" }
    end
	end

	# def show
	# end

	# def update
	# end

	# def edit
	# end

	# def destroy
	# end

	private
	def issue_params
		params.require(:issue).permit(:email, :title, :body, :data_image)
	end

end

class IssuesController < ApplicationController

	# def index
	# end

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
		params.require(:issue).permit(:email, :title, :body)
	end

end

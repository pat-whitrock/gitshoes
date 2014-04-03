class IssuesController < ApplicationController

	# def index
	# end

	def new
		@issue = Issue.new
		render :partial => "new"
	end

	def create
		Issue.create_github_issue(issue_params)
		redirect_to repo_path
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

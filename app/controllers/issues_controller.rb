class IssuesController < ApplicationController

	# def index
	# end

	def new
		@issue = Issue.new
	end

	def create
		create_github_issue(issue_params)
		redirect_to new_issue_path
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
		params.require(:issue).permit(:email, :title, :body, :repo)
	end

	def create_github_issue(attributes)
		client = Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"])
		user = client.user.login
		client.create_issue('pat-whitrock/gitshoes', attributes['title'], attributes['body'])
	end

end

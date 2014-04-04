class Issue < ActiveRecord::Base
	belongs_to :repo

	def self.create_github_issue(attributes, repository)
		client = Octokit::Client.new(:access_token => repository.token)
		user = client.user.login
		if attributes['email'].length > 0
			issue_body = "From: #{attributes['email']}\n\n#{attributes['body']}"
		else
			issue_body = attributes['body']
		end
		client.create_issue(repository.full_name, attributes['title'], issue_body)
	end

end

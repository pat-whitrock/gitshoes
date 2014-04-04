class Issue < ActiveRecord::Base
	belongs_to :repo

	def self.create_github_issue(attributes, repository)
		client = Octokit::Client.new(:access_token => repository.token)
		user = client.user.login
		client.create_issue(repository.full_name, attributes['title'], attributes['body'])
	end

end

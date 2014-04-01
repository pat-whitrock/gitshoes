class Issue < ActiveRecord::Base
	belongs_to :repo

	def self.create_github_issue(attributes)
		client = Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"])
		user = client.user.login
		client.create_issue('pat-whitrock/gitshoes', attributes['title'], attributes['body'])
	end

end

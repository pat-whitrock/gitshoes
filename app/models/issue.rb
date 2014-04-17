class Issue < ActiveRecord::Base
	belongs_to :repo
	# accepts_nested_attributes_for :widget
	# accepts_nested_attributes_for :repos

	def self.create_github_issue(attributes, repository)
		uri = URI::Data.new(attributes['data_image'])
		# encoded_uri = Base64.encode64(open(uri) { |io| io.read })
		f = File.new('test.png', 'w+')
		f.write(uri.data.force_encoding('UTF-8'))
		f.close
		binding.pry
		AWS::S3::S3Object.store(
			"#{repository.id}/screenshots",
			open('test.png'),
			"gitshoes",
			access: :public_read
		)
		client = Octokit::Client.new(:access_token => repository.users[0].token)
		user = client.user.login
		if attributes['email'].length > 0
			issue_body = "From: #{attributes['email']}\n\n#{attributes['body']}"
		else
			issue_body = attributes['body']
		end
		client.create_issue(repository.full_name, attributes['title'], issue_body)
	end

end

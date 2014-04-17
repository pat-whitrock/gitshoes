class Issue < ActiveRecord::Base
	belongs_to :repo
	# accepts_nested_attributes_for :widget
	# accepts_nested_attributes_for :repos

	def self.create_github_issue(attributes, repository)
		uri = URI::Data.new(attributes['data_image'])
		# encoded_uri = Base64.encode64(open(uri) { |io| io.read })
		f = File.new('newtest.png', 'w+')
		f.write(uri.data.force_encoding('UTF-8'))
		f.close

		connection = Fog::Storage.new({
			:provider           => 'AWS',
			:bucket_name => 'gitshoes',
			:aws_access_key_id => ENV['AWS_ID'],
			:aws_secret_access_key => ENV['AWS_SECRET']
		})
		directory = connection.directories.first
		file = directory.files.create(
			:key    => 'newtest.png',
			:body   => File.open("newtest.png"),
			:public => true
		)
		image_url = "https://s3-us-west-2.amazonaws.com/gitshoes/newtest.png"
		client = Octokit::Client.new(:access_token => repository.users[0].token)
		user = client.user.login
		if attributes['email'].length > 0
			issue_body = "From: #{attributes['email']}\n\n#{attributes['body']}\n\nScreenshot: #{image_url}"
		else
			issue_body = attributes['body']
		end
		client.create_issue(repository.full_name, attributes['title'], issue_body)
	end

end

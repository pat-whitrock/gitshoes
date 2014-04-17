require 'tempfile'
class Issue < ActiveRecord::Base
	belongs_to :repo
	# accepts_nested_attributes_for :widget
	# accepts_nested_attributes_for :repos

	def self.create_github_issue(attributes, repository)
		uri = URI::Data.new(attributes['data_image'])
		f = Tempfile.new(['screenshot', '.png'])
		f.write(uri.data.force_encoding('UTF-8'))
		f.close
		image_file_name = f.path.split('/').last

		connection = Fog::Storage.new({
			:provider           => 'AWS',
			:bucket_name => 'gitshoes',
			:aws_access_key_id => ENV['AWS_ID'],
			:aws_secret_access_key => ENV['AWS_SECRET']
		})
		directory = connection.directories.first
		file = directory.files.create(
			:key    => image_file_name,
			:body   => IO.read(f.path),
			:public => true
		)
		image_url = "https://s3-us-west-2.amazonaws.com/gitshoes/#{image_file_name}"
		client = Octokit::Client.new(:access_token => repository.users[0].token)
		user = client.user.login
		if attributes['email'].length > 0
			issue_body = "From: #{attributes['email']}\n\n#{attributes['body']}\n\nScreenshot: #{image_url}"
		else
			issue_body = "#{attributes['body']}\n\nScreenshot: #{image_url}"
		end
		client.create_issue(repository.full_name, attributes['title'], issue_body)
	end

end

AWS::S3::Base.establish_connection!(
	access_key_id: ENV["AWS_ID"],
	secret_access_key: ENV["AWS_SECRET"]
)
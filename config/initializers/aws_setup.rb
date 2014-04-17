AWS::S3::Base.establish_connection!(
	access_key_id: Rails.application.secrets.aws_id,
	secret_access_key: Rails.application.secrets.aws_secret
)


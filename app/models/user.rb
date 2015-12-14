class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :repos, through: :subscriptions
  devise :omniauthable, omniauth_providers: [:github]

  def self.find_for_github_oauth auth
    where(:email => auth["info"]["email"]).first_or_create do |user|
      user.provider = auth.provider
      user.token = auth.credentials.token
      user.email = auth.info.email
      user.name = auth.info.name
      user.github_login = auth.extra.raw_info.login
      user.image = auth.info.image
    end
  end
end

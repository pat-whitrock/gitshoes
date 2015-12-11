class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :repos, through: :subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :omniauthable, :omniauth_providers => [:github]
   		#:database_authenticatable, :registerable,
        #:recoverable, :rememberable, :trackable, :validatable,

  def self.find_for_github_oauth(auth)
  	where(:email => auth["info"]["email"]).first_or_create do |user|
  		user.provider = auth.provider
  		user.token = auth.credentials.token
      user.email = auth.info.email
      user.name = auth.info.name
      user.github_login = auth.extra.raw_info.login
      user.image = auth.info.image
  	end
  end

  def organization_repos(client)
    Octokit.auto_paginate = true
    organizations = client.organizations.map { |orgs| orgs.login }
    org_repos = organizations.map do |org|
      client.org_repositories(org)
    end.flatten
  end

  def github_repos
    Octokit.auto_paginate = true
    client = Octokit::Client.new(:access_token => self.token)
    repos = client.repositories
    org_repos = organization_repos(client)
    repos << org_repos
    repos.flatten!
    repos.uniq! { |repo| repo.id }
    return {:repos => repos}
  end

end

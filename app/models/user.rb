class User < ActiveRecord::Base
  has_many :user_repos
  has_many :repos, through: :user_repos

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
    repos = client.search_repositories("user:#{client.user[:login]}")[:items]
    org_repos = organization_repos(client)
    repos << org_repos
    repos.flatten!
    repos.uniq! { |repo| repo.id }
    return {:repos => repos}
  end

  def add_from_collaborators
    user_repos_urls = self.repos.map do |repo|
      repo.address
    end
    repos_return = self.github_repos
    repos = repos_return[:repos].reject { |repo|
      user_repos_urls.include?(repo.html_url)
    }
    repos.each do |repo|
      if new_user_repo = Repo.where(address: repo.html_url).first
        self.repos << new_user_repo
      end
    end
  end
end

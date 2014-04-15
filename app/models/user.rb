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

  def github_repos
    Octokit.per_page=100
    client = Octokit::Client.new(:access_token => self.token)
    repos_count= client.search_repositories("user:#{client.user[:login]}").total_count
    last_response = client.last_response
    number_of_pages = last_response.rels[:last].href.match(/page=(\d+)$/)[1]
    repos = []
    (1..number_of_pages.to_i).each do |page|
      repos += client.search_repositories("user:#{client.user[:login]}", :sort => "updated", :order => "desc", :page => page)[:items]
    end
    return {:repos => repos}
  end
end

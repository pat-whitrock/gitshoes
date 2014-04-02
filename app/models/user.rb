class User < ActiveRecord::Base
  has_many :user_repos
  has_many :repos, through: :user_repos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :omniauthable, :omniauth_providers => [:github]
   		#:database_authenticatable, :registerable,
        #:recoverable, :rememberable, :trackable, :validatable, 

  def self.find_for_github_oauth(auth)
  	where(auth.slice(:provider, :token)).first_or_create do |user|
  		user.provider = auth.provider
  		user.token = auth.credentials.token
  	end
  end
end

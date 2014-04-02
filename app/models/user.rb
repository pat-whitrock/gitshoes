class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :omniauthable, :omniauth_providers => [:github]
   		#:database_authenticatable, :registerable,
        #:recoverable, :rememberable, :trackable, :validatable, 

  def self.find_for_github_oauth(auth)
  	where(auth.slice(:provider, :token)).first_or_create do |user|
  		user.provider = auth.provider
  		user.token = auth.credentials.token
      user.email = auth.info.email
      user.name = auth.info.name
      user.github_login = auth.extra.raw_info.login
      user.image = auth.info.image
  	end
  end
end

class Repo < ActiveRecord::Base
	has_many :issues
	has_many :user_repos
	has_many :users, through: :user_repos
	has_one :widget
	validates :address, uniqueness: true

	def self.add_existing_repos(repos, user)
		repos.select do |repo|
			if new_user_repo = Repo.where(address: repo.html_url).first
				user << new_user_repo
				false
			else
				true
			end
		end
	end

end

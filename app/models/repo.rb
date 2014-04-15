class Repo < ActiveRecord::Base
	has_many :issues
	has_many :user_repos
	has_many :users, through: :user_repos
	has_one :widget
	validates :address, uniqueness: true

	def self.add_existing_repos(repos, user)
		# binding.pry
		repos.select do |repo|
			# binding.pry
			if new_user_repo = Repo.where(address: repo.html_url).first
				user.repos << new_user_repo
				false
			else
				true
			end
		end
	end

end

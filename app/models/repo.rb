class Repo < ActiveRecord::Base
	has_many :issues
	has_many :user_repos
	has_many :users, through: :user_repos
	has_one :widget
	validates :address, uniqueness: true

  def self.has_address?(address)
    exists?(:address => address)
  end

  def self.find_or_add_user_to_repo(address)
  	existing_repo = Repo.where(:address => address).first
		existing_users = existing_repo.users.map {|user| user.id}
		unless existing_users.include?(current_user.id)
			Repo.where(:address => address).first.users << current_user
		end
  end

  def destroy_or_remove_user(user_id)
  	if @repo.users.count > 1
			UserRepo.where(:user_id => user_id, :repo_id => @repo.id).first.destroy
		else
			@repo.destroy
		end
  end

end

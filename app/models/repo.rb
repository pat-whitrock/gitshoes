class Repo < ActiveRecord::Base
  has_many :issues
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_one :widget
  validates :address, uniqueness: true

  def self.from_github github_repo
    new({
      address: github_repo.html_url,
      name: github_repo.name,
      full_name: github_repo.full_name,
      description: github_repo.description,
      language: github_repo.language,
      open_issue_count: github_repo.open_issues_count,
      github_created_at: github_repo.created_at,
      github_updated_at: github_repo.updated_at
    })
  end

  def self.has_address? address
    exists?(:address => address)
  end

  def self.find_or_add_user_to_repo address, current_user
    existing_repo = Repo.where(:address => address).first
    existing_users = existing_repo.users.map {|user| user.id}
    unless existing_users.include?(current_user.id)
      Repo.where(:address => address).first.users << current_user
    end
  end

  def destroy_or_remove_user user_id, repo
    if repo.users.count > 1
      Subscription.where(:user_id => user_id, :repo_id => repo.id).first.destroy
    else
      repo.widget.destroy
      repo.destroy
    end
  end
end

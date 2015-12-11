class RenameUserReposToSubscriptions < ActiveRecord::Migration
  def change
    rename_table :user_repos, :subscriptions
  end
end

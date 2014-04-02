class AddNameAndDescriptionAndLanguageAndOpenIssuesCountAndGithubCreatedAtAndGithubUpdatedAtToRepos < ActiveRecord::Migration
  def change
  	add_column :repos, :name, :string
  	add_column :repos, :description, :text
  	add_column :repos, :language, :string
  	add_column :repos, :open_issue_count, :integer
  	add_column :repos, :github_created_at, :datetime
  	add_column :repos, :github_updated_at, :datetime
  end
end

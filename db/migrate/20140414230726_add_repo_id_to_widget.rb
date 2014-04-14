class AddRepoIdToWidget < ActiveRecord::Migration
  def change
  	add_column :widgets, :repo_id, :integer
  end
end

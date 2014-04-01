class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :body
      t.string :email

      t.timestamps
    end
  end
end

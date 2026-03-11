class RenameArticlesModelToPosts < ActiveRecord::Migration[7.2]
  def change
    rename_table :articles, :posts
  end
end

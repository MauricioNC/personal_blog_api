class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end

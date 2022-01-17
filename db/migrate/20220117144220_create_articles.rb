class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.date :date
      t.string :blurb
      t.integer :author_id
      t.integer :pub_id

      t.timestamps
    end
  end
end

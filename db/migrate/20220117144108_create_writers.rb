class CreateWriters < ActiveRecord::Migration[7.0]
  def change
    create_table :writers do |t|
      t.string :name
      t.integer :articles_count

      t.timestamps
    end
  end
end

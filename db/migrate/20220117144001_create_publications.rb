class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.string :pub_name
      t.string :pub_address
      t.integer :articles_count

      t.timestamps
    end
  end
end

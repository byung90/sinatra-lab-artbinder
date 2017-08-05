class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.string :medium
      t.integer :year
      t.float :price
      t.integer :artist_id

      t.timestamp
    end
  end
end

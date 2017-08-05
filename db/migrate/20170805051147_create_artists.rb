class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :user_id

      t.timestamp
    end
  end
end

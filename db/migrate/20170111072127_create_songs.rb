class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.integer :album_id
      t.string :album_type
      t.integer :category_id
      t.integer :views_count
      t.float :avg_rates
      t.boolean :is_pin
      t.string :url_content

      t.timestamps
    end
  end
end

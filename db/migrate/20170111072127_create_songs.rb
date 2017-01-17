class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.integer :album_id
      t.integer :category_id
      t.integer :views, default: 0
      t.float :avg_rates
      t.boolean :is_pin
      t.string :url_content
      t.integer :composer_id
      t.integer :singer_id

      t.timestamps
    end
  end
end

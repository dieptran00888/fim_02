class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :user_id
      t.string :name
      t.integer :views, default: 0
      t.float :avg_rates
      t.integer :album_type
      t.attachment :avatar
      t.integer :category_id

      t.timestamps
    end
  end
end

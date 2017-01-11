class CreateFavourites < ActiveRecord::Migration[5.0]
  def change
    create_table :favourites do |t|
      t.integer :favouritable_id
      t.integer :favouritable_type
      t.integer :user_id

      t.timestamps
    end
  end
end

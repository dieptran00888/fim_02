class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :avatar
      t.date :date_of_birth
      t.integer :type_of_music

      t.timestamps
    end
  end
end

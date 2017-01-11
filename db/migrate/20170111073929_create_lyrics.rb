class CreateLyrics < ActiveRecord::Migration[5.0]
  def change
    create_table :lyrics do |t|
      t.integer :user_id
      t.integer :song_id
      t.text :content
      t.integer :status
      t.boolean :is_approve

      t.timestamps
    end
  end
end

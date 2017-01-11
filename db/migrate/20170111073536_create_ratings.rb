class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :rates
      t.integer :ratable_id
      t.string :ratable_type

      t.timestamps
    end
    add_index :ratings, [:ratable_type, :ratable_id]
  end
end

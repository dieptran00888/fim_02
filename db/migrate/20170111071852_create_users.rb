class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :is_admin, default: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :users, :deleted_at
  end
end

class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.integer :user_id
      t.text :content
      t.integer :parent_id
      t.string :commentable_type
      t.timestamps
    end
    add_index :comments, [:commentable_type, :commentable_id]
  end
end

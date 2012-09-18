class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :photo_name
      t.string :photo_path
      t.string :photo_type
      t.integer :user_id

      t.timestamps
    end
  end
end

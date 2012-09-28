class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.string :name
      t.string :path
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end

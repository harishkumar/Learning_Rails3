class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :salt
      t.integer :role_id
      t.string :email

      t.timestamps
    end
  end
end

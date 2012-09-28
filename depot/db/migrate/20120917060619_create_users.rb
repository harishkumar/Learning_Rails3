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
      User.create :name => 'admin',:password   => 'research',:role_id => 1,
    :email=> 'admin@eabyas.com'

  end

end

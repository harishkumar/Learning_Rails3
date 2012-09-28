class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    Role.create :name   => 'Admin' 
    Role.create :name   => 'Seller'
    Role.create :name   => 'Buyer'
  end

end

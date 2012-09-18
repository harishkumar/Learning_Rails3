class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :seller_id
      t.integer :buyer_id
      t.string :reciept_no
      t.integer :quantity

      t.timestamps
    end
  end
end

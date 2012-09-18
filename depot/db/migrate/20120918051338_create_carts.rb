class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.string :description
      t.integer :product_id
      t.integer :buyer_id
      t.integer :seller_id
      t.decimal :price
      t.decimal :total_price
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end

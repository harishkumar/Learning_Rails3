class AddProductIdtoOrder < ActiveRecord::Migration
  def up
    add_column :orders,:product_id,:integer
  end

  def down
  end
end

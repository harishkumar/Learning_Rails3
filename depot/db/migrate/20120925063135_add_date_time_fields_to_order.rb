class AddDateTimeFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders,:shopping_date,:date
    add_column :orders,:shopping_time,:time
    add_column :orders,:payment_amount,:decimal
    add_column :orders,:approval,:boolean
  end
end

class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :tax
      t.string :shipping
      t.decimal :total
      t.references :order_status, index: true

      t.timestamps
    end
  end
end

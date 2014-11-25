class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.references :product
      t.float :sale_price
      t.datetime :deadline

      t.timestamps
    end
  end
end

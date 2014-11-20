class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.float :price
      t.text :description
      t.string :image
      t.integer :stock
      t.timestamp :lastUpdated
      t.integer :categoryID

      t.timestamps
    end
  end
end

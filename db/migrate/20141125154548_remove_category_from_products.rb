class RemoveCategoryFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :categoryID
  end
end

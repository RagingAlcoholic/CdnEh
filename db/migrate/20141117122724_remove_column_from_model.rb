class RemoveColumnFromModel < ActiveRecord::Migration
  def change
    
    remove_column :Products, :lastUpdated
  end
end

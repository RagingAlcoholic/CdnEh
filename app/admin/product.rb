ActiveAdmin.register Product do

  permit_params :sku, :name, :price, :description, :image, :stock, :categoryID
 


end

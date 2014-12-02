ActiveAdmin.register Product do

  permit_params :sku, :name, :price, :description, :image, :stock, :category_id
  form(:html => { :multipart => true }) do |f|
    f.inputs "Product" do
      f.input :sku
      f.input :name
      f.input :price
      f.input :description
      f.input :image, :as => :file
      f.input :stock
      f.input :category_id
    end
    f.actions
  end
end

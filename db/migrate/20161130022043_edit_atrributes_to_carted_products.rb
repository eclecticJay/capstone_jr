class EditAtrributesToCartedProducts < ActiveRecord::Migration[5.0]
  def change
  	rename_column :carted_products, :products_id, :product_id
  end
end

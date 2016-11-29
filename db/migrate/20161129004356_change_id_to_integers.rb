class ChangeIdToIntegers < ActiveRecord::Migration[5.0]
  def change
  	add_column :categorized_products, :product_id, :string
  	add_column :categorized_products, :category_id, :string
  end
end

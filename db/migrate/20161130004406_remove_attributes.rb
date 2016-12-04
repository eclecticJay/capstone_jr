class RemoveAttributes < ActiveRecord::Migration[5.0]
  def change
  	remove_column :orders, :product_id, :string
  	remove_column :orders, :quantity, :string
  end
end

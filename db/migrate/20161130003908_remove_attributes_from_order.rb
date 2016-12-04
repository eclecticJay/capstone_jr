class RemoveAttributesFromOrder < ActiveRecord::Migration[5.0]
  def change
  	remove_column :orders, :product_id, :string
  	remove_column :orders, :user_id, :string
  end
end

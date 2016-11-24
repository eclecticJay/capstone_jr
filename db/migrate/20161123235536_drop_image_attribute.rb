class DropImageAttribute < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :image, :string
  	remove_column :products, :stock, :boolean
  end
end

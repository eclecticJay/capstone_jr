class FixingError < ActiveRecord::Migration[5.0]
  def change
  	rename_column :orders, :quanitity, :quantity 
  end
end

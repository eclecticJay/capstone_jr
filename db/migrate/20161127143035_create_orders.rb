class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.string :product_id
      t.string :quanitity
      t.string :subtotal
      t.string :tax
      t.string :total

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true
      t.string :supplier_ref
      t.string :delta_ref
      t.float :sell_price
      t.float :buy_price
      t.string :product_number
      t.references :supplier, foreign_key: true
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end

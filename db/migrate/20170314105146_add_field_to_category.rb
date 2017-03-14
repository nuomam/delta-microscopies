class AddFieldToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :name_en
  end
end

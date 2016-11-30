class AddNameToSubcategories < ActiveRecord::Migration[5.0]
  def change
    add_column :subcategories, :name, :string
  end
end

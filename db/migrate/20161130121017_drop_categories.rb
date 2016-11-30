class DropCategories < ActiveRecord::Migration[5.0]
  def change
    drop_table :categories
  end
end

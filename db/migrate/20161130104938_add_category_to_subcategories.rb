class AddCategoryToSubcategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :subcategories, :category, foreign_key: true
  end
end

class RemoveCategoryToCategoriess < ActiveRecord::Migration[5.0]
  def change
    remove_reference :subcategories, :category
  end
end

class RemoveSubcategoryToSkills < ActiveRecord::Migration[5.0]
  def change
    remove_reference :skills, :subcategory
  end
end

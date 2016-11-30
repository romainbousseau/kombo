class AddSubategoryToSkills < ActiveRecord::Migration[5.0]
  def change
    add_reference :skills, :subcategory, foreign_key: true
  end
end

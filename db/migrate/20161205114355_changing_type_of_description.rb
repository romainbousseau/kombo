class ChangingTypeOfDescription < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :profile_description, :text
  end
end

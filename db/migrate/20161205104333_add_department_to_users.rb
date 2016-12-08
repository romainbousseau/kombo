class AddDepartmentToUsers < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :work_department, :string
      add_column :users, :profile_description, :string

  end
end

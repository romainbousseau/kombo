class DropUserskills < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_skills
  end
end

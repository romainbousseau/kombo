class RemoveUserFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :user_id
    add_reference :matches, :problem_user, references: :users
    add_reference :matches, :solver_user, references: :users
  end
end

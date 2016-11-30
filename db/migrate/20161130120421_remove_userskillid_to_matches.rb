class RemoveUserskillidToMatches < ActiveRecord::Migration[5.0]
  def change
    remove_reference :matches, :user_skill
  end
end

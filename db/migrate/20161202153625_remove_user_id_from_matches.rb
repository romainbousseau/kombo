class RemoveUserIdFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :user_id 
  end
end

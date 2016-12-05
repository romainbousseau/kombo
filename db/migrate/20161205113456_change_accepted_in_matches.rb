class ChangeAcceptedInMatches < ActiveRecord::Migration[5.0]
  def change
    change_column :matches, :accepted, :string, :default => 'pending'
    rename_column :matches, :accepted, :status
  end
end

class RenameMatchInMessages < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :match_id, :work_session_id
  end
end

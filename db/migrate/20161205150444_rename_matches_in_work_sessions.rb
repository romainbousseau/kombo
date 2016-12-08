class RenameMatchesInWorkSessions < ActiveRecord::Migration[5.0]
  def change
    rename_table :matches, :work_sessions
  end
end

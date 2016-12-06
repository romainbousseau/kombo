class RenameAcceptedInWorkSessions < ActiveRecord::Migration[5.0]
  def change
    rename_column :work_sessions, :accepted, :status
    change_column :work_sessions, :status, :string, default: "pending"
  end
end

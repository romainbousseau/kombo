class RecreateTableMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :work_session, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :user_skill, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :starts_at
      t.integer :duration
      t.text :brief
      t.boolean :accepted, :default => false

      t.timestamps
    end
  end
end

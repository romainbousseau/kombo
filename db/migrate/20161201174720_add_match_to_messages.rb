class AddMatchToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :match, foreign_key: true
  end
end

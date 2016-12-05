class AddFieldsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :user, foreign_key: true
  end
end

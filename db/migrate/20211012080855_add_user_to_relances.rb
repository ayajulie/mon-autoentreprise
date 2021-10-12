class AddUserToRelances < ActiveRecord::Migration[6.0]
  def change
    add_reference :relances, :user, foreign_key: true
  end
end

class RemoveClientFromDevi < ActiveRecord::Migration[6.0]
  def change
    remove_reference :devis, :client, null: false, foreign_key: false
  end
end

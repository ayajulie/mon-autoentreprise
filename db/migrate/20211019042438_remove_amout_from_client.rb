class RemoveAmoutFromClient < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :amout, :integer
  end
end

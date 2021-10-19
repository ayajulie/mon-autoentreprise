class RemoveDateFromClient < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :date, :datetime
  end
end

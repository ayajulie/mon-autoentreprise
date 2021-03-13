class ChangeDateFormat < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :start_activity, :string
    change_column :users, :birth_date, :string
  end
end

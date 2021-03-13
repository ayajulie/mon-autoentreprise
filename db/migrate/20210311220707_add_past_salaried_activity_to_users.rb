class AddPastSalariedActivityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :past_salaried_activity, :boolean
  end
end

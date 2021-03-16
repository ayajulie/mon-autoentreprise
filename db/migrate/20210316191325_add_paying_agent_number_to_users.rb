class AddPayingAgentNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :paying_agent_number, :string
  end
end

class AddFieldToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :exercising_mode_declaration, :string
    add_column :users, :business_origin, :string
    add_column :users, :establishment_address, :string
    add_column :users, :paying_agent, :string

  end
end

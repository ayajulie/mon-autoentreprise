class AddFiscalInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :individual_entrepreneur, :boolean
    add_column :users, :bic_status, :boolean
    add_column :users, :contribution_periodicity, :string
    add_column :users, :other_activity, :boolean
    add_column :users, :income_tax_lump_payment, :boolean
  end
end

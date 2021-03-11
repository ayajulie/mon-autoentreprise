class ChangeAmount < ActiveRecord::Migration[6.0]
  def change
    rename_column :invoices, :amout, :amount
  end
end

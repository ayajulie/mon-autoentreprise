class RenameNumberToAmountInInvoice < ActiveRecord::Migration[6.0]
  def change
    rename_column :invoices, :number, :amount
  end
end

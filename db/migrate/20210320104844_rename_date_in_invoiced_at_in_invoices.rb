class RenameDateInInvoicedAtInInvoices < ActiveRecord::Migration[6.0]
  def change
    rename_column :invoices, :date, :invoiced_at
  end
end

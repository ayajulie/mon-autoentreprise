class RemoveInvoiceAtFromInvoices < ActiveRecord::Migration[6.0]
  def change
    remove_column :invoices, :invoice_at, :datetime
  end
end

class AddDateInvoiceAtInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :date_invoice_at, :datetime
  end
end

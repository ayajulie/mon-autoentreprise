class AddInvoiceAtInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :invoice_at, :datetime
  end
end

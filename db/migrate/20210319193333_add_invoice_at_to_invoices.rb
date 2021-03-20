class AddInvoiceAtToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :invoice_at, :datetime, null:false
  end
end

class AddClientToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :client, foreign_key: true
  end
end

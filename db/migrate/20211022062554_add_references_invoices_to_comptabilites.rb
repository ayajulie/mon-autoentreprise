class AddReferencesInvoicesToComptabilites < ActiveRecord::Migration[6.0]
  def change
    add_reference :comptabilites, :invoices, foreign_key: true
  end
end

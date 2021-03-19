class RemoveDateFromInvoices < ActiveRecord::Migration[6.0]
  def change
     remove_column :invoices, :date, :datetime
  end
end

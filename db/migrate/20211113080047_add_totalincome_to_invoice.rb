class AddTotalincomeToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :totalincome, :integer
  end
end

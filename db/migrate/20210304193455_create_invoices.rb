class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :name
      t.string :object
      t.integer :amout
      t.integer :pretaxamout
      t.integer :postaxmout
      t.datetime :date
       # t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

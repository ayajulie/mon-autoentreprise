class CreateAchats < ActiveRecord::Migration[6.0]
  def change
    create_table :achats do |t|
      t.string :name
      t.integer :amount
      t.integer :reference
      t.integer :tva
      t.date :date_facture
      t.date :date_paiement
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

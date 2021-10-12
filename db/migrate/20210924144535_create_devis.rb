class CreateDevis < ActiveRecord::Migration[6.0]
  def change
    create_table :devis do |t|
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :reference_devis
      t.integer :amount
      t.datetime :date
      t.string :object
      t.string :interet

      t.timestamps
    end
  end
end

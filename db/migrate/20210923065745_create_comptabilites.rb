class CreateComptabilites < ActiveRecord::Migration[6.0]
  def change
    create_table :comptabilites do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :immobilisations
      t.integer :valeur_credit_bail
      t.integer :charges_repartir
      t.integer :primes_remboursement
      t.integer :stocks
      t.integer :avances
      t.integer :creance
      t.integer :effets_escomptes
      t.integer :valeur_mobilieres
      t.integer :disponibilites
      t.integer :capitaux_propres
      t.integer :dettes_financieres
      t.integer :emprunt_credit_bail
      t.integer :dettes_exploitations
      t.integer :dettes_fiscales
      t.integer :tresorerie_passive

      t.timestamps
    end
  end
end

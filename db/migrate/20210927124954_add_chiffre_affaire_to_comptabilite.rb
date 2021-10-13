class AddChiffreAffaireToComptabilite < ActiveRecord::Migration[6.0]
  def change
    add_column :comptabilites, :chiffre_affaire, :integer
  end
end
